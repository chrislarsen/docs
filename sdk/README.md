# The JavaScript SDK

## Prerequisites

### Setting Up The Proxy

In order to communicate with the APIs without exposing the API key to prying eyes, the SDK requires a very basic reverse proxy to be set up through which it can call the back-end. To make this process as simple as possible, [we provide a set of example implementations](https://github.com/globaldawn/api-example-proxy) in a wide variety of languages or configurations.

We strongly recommend tha you use the Nginx, Apache, or other web server versions where possible &mdash; these are much faster than the alternatives by an order of magnitude.

#### Configuring The Proxy

TODO

#### Writing Your Own Proxy Implementation

You are by no means limited to using the example implementations of the proxy that we have provided. The proxy itself has a very small list of requirements for it to work, which can be implemented easily:

* It must listen on the same origin (ie. same domain and port) as the document that loads the SDK.
* It should proxy all requsts to `https://apis.globaldawn.co/`.
* If it is listening at `/gd/proxy`, and `/gd/proxy/apis/test` is called, the `/gd/proxy` prefix should be stripped off &mdash; this means in this example, the request would be proxied to `https://apis.globaldawn.co/apis/test`.
* It must preserve all appropriate headers.
* It must preserve any query string.
* It must add one header, the `X-GD-API-Key` header &mdash; the value should be the API key for your account.
* It should send back the response to the requestee exactly as received from our APIs &mdash; that means headers should also be preserved.

As long as these rules are followed, you can implement the proxy any way you choose, and in any language/framework/tool of your choice.

## Loading The SDK

You can load the SDK by simply adding the following script tag in the `<head>` of your documentes:

```html
<script src="https://static-files.globaldawn.co/js/gd-sdk-bootstrap.js"></script>
```

This is a very small JavaScript file that should not be cached. It loads the actual SDK from our CDN, making sure the delivery to the client is as fast as possible but ensuring updates are timely.

## Configuring The SDK

Without configuring the SDK, none of your plugins will load on the page. When the SDK is loaded, it calls a function on the `window` object, so define this callback:

```js
window.gdLoaded = function(gd) {
  //
};
```

We recommend you define this function in a `<script>` tag (an external script is fine) **directly after the `<script>` tag that loads the SDK**.

Note that this callback gets passed an reference to the SDK, which you can use to do the actual configuration. To do this configuration, you simply call `gd.init` (make sure you do this inside the callback we just defined):

```js
gd.init({
  foo: "bar"
}).then(function() {
  // Code for handling SDK events goes in here.
});
```

The `gd.init` function takes one argument, a key/value `Object` of options to change various SDK settings. The full list of settings is as follows:

* `proxyPath`, `String`, default `"/gd/proxy"`: The path to the proxy through which the communication to the APIs will happen. This **must** be on the same domain and port as the page which is loading the SDK, or you'll get cross domain issues. Set the value of this option to the path at which your proxy (as configured previously in this guide) is listening.
* `loadStylesheets`, `Boolean`, default `true`: Set this to false to disable the loading of any stylesheets for the plugins. This allows you to completely control the look and feel of any plugins.

The return value of `gd.init` is a "promise", which means you can add a callback for when this promised data is finished fetching by calling the `then` function as in the above example. Note that this is completely optional &mdash; if you don't need to subscribe to or broadcast any events, then you can just drop the `then` call.

Onwards into this documentation, any code we give examples for should be assumed to be in this  callback unless otherwise explicitly mentioned.

For your reference, here are the previous examples combined into a single script:

```html
<script src="https://static-files.globaldawn.co/js/gd-sdk-bootstrap.js"></script>
<script>
window.gdLoaded = function() {
  gd.init({
    foo: "bar"
  }).then(function() {
    // Code for handling SDK events goes in here.
  });
}
</script>
```

## Declarative Markup

The SDK is used to start any plugins found in the DOM of the document it is loaded within. As such, it looks through the document for any declarative markup that represents plugins that need to be loaded, and loads them.

You can read all about this in depth in [the documentation on the plugins](https://github.com/globaldawn/docs/blob/master/plugins/README.md).

## Event Subcribing and Broadcasting

If you want to trigger actions when the user interacts with a plugin, or want to trigger plugins to change their state, you need to subscribe to, or broadcast, events.

### Subscribing

All plugins broadcast at least some events &mdash; the exact events they broadcast are documented in [the documentation on the plugins](https://github.com/globaldawn/docs/blob/master/plugins/README.md).

Regardless of what event you are handling, the code pattern is the same:

```js
gd.events('/some/event/name').subscribe(function(arg1, arg2, ...) {
  // Code for handling this event goes in here.
});
```

Because the event system is just a publish/subscribe implementation, you can listen for any arbitrary event name (ie. ones you might broadcast yourself later).

If an event provides data, your callback will be passed one argument for each piece of data it provided. Note that there are lots of events that don't provide any data, so these callbacks won't take any arguments.

One nice feature of the `subscribe` method is that you can set the context of `this` when your callback is invoked:

```js
gd.events('/some/event/name').subscribe([callback, context]);
```

Whatever object you provide as the value of `context` in this format of `subscribe` will become the value of `this` when the callback is triggered by an event broadcast.

Even if a plugin reloads itself, the event names are constant, so you don't need to worry about memory leaks with the callbacks. Regardless, if you do want to unsubcribe a plugin, you can do so by calling the `unsubscribe` method:

```js
gd.events('/some/event/name').subscribe(callback);
gd.events('/some/event/name').unsubscribe(callback);
```

You can remove multiple callbacks at once:

```js
gd.event('/some/event/name').unsubscribe(callback1, callback2, ...);
```

Note that `subscribe` and `unsubscribe` both return an object suitable for chaining with `broadcast`:

```js
gd.events('/some/event/name').broadcast().unsubscribe(callback);
```

### Broadcasting

At this stage, most of the plugins listen to events that are really only useful internally to the SDK. That said, if a plugin does listen for an event, it will be listed in [the documentation on the plugins](https://github.com/globaldawn/docs/blob/master/plugins/README.md).

As with subscribing to events, you can broadcast events with a common code pattern:

```js
gd.events('/some/event/name').broadcast(arg1, arg2, ...);
```

You don't have to provide the `broadcast` method with any arguments if you don't want, but if you do they will be used as the arguments when calling any callbacks for the event you fire.

The `broadcast` method is synchronous, which means that if there are a lot of callbacks, it won't pass control onto the next line of code until all the callbacks are finished.

Again, as with the `subscribe` and `unsubscribe` methods, `broadcast` returns an object suitable for chaining:

```js
gd.events('/some/event/name').subscribe(callback).broadcast();
```
