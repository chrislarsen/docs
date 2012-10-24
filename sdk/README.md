# The JavaScript SDK

## Prerequisites

### Setting Up The Proxy

In order to communicate with the APIs without exposing the API key to prying eyes, the SDK requires a very basic reverse proxy to be set up &mdash; it is through this proxy that it will call the back-end. To make this process as simple as possible, [we provide a set of example implementations](https://github.com/globaldawn/api-example-proxy) in a wide variety of languages or configurations.

You need to install one of these proxies (or write your own, see below) on your server for the SDK and plugins to work. If you use one of the example proxies, follow the instructions for installation in the folder for that implementation.

> :information_source: &nbsp;**Note:** We strongly recommend that you use one of the web server implementations (Nginx, Apache, etc.) &mdash; these are much faster than the alternative implementations by an order of magnitude, as they are meant for this kind of job.

#### Configuring The Proxy

To configure any of the example proxies, you simply need to open the script or configuration provided and add your API key (you can find this in the Admin Manager). Once you have done this, deploy the proxy to your server and test that it is working by sending a GET request to:

    <path to the proxy>/ping

If you're pointing to the right place, you should get a response: "pong".

#### Writing Your Own Proxy Implementation

You are by no means limited to using the example implementations of the proxy that we have provided. The proxy itself has a very small list of requirements for it to work, which can be implemented easily:

* It must receive requests on the same origin (ie. same domain and port) as all the HTML documents that load the SDK.
* It should proxy all requsts it receives to `https://apis.globaldawn.com/`.
* The endpoint the proxy is hosted at should be stripped off &mdash; as an example with the proxy hosted at `/gd/proxy`, a request to `/gd/proxy/apis/test` would be proxied to `https://apis.globaldawn.com/apis/test` (note the `/gd/proxy` portion has been stripped off).
* It must preserve all headers.
* It must preserve, if present, the query string.
* It must add one additional header, `X-GD-API-Key` &mdash; the value should be the API key for your account.
* It should send back the response to the client exactly as received from our APIs &mdash; that means response headers should be preserved.

As long as these rules are followed, you can implement the proxy any way you choose, and in any language/framework/tool of your choice.

## Loading The SDK

You can load the SDK by simply adding the following script tag in the `<head>` of your documentes:

```html
<script src="https://static-files.globaldawn.com/js/gd-sdk-bootstrap.js"></script>
```

This is a very small JavaScript file that loads the SDK from our CDN, making sure the delivery to the client is as fast as possible but ensuring SDK updates are distributed quickly.

## Configuring The SDK

Without configuring the SDK, none of your plugins will load on the page. When the SDK is loaded, it calls a function on the `window` object, so define this callback:

```js
window.gdLoaded = function(gd) {
  // ...
};
```

We recommend you define this function in a `<script>` tag (an external script is fine) **directly before the `<script>` tag that loads the SDK**.

When this function is called, the SDK has been loaded, but not started. To start and configure the SDK, call `gd.init` with your configuration settings (where `gd` is the reference to the SDK that is passed into `window.gdLoaded`):

```js
gd.init({
  foo: "bar"
});
```

The `gd.init` function takes one argument, a key/value `Object` of options to change various SDK settings. The following table shows the possible settings you can configure the SDK with:

| name | type | default | description |
|------|------|---------|-------------|
| `proxyPath` | `String` | `"/gd/proxy"` | The path to the proxy through which the communication to the APIs will happen. This **must** be on the same domain and port as the page which is loading the SDK, or you'll get cross domain issues. Set the value of this option to the path at which your proxy (as configured previously in this guide) is listening. |
| `loadStylesheets` | `Boolean` | `true` | Set this to false to disable the loading of any stylesheets for the plugins. This allows you to completely control the look and feel of any plugins. |

The return value of `gd.init` is a "promise", and you can add a callback for when the SDK startiup is finished by adding a callback using the `then` function. Whilst this is completely optional, if you need to use SDK events you will need to define this &mdash; if you don't need to subscribe to or broadcast any events, then you can just drop the `then` call.

```js
gd.init({
  foo: "bar"
}).then(function() {
  // Code for handling SDK events goes in here.
});
```

For reference, here is the bare minimum you need to get the SDK up and running as a single script:

```html
<script>
window.gdLoaded = function() {
  gd.init({
    foo: "bar"
  });
}
</script>
<script src="https://static-files.globaldawn.com/js/gd-sdk-bootstrap.js"></script>
```

## Declarative Markup

The SDK is used to start any plugins found in the DOM of the document it is loaded within. As such, it looks through the document for any declarative markup and loads any plugins it finds.

You can read all about this in depth in [the documentation on the plugins](https://github.com/globaldawn/docs/blob/master/plugins/README.md).

## Event Subscribing and Broadcasting

If you want to trigger actions when the user interacts with a plugin, or want to trigger plugins to change their state, you need to subscribe to or broadcast events. To handle events, you need to define the `then` promise callback when calling `gd.init`:

```js
gd.init({
  foo: "bar"
}).then(function() {
  // Code for handling SDK events goes in here.
});
```

### Subscribing

All plugins broadcast at least some events &mdash; the exact events they broadcast are documented in [the documentation on the plugins](https://github.com/globaldawn/docs/blob/master/plugins/README.md).

Regardless of what event you are handling, the code pattern is the same:

```js
gd.event('/some/event/name').subscribe(function(arg1, arg2, ...) {
  // Code for handling this event goes in here.
});
```

Because the event system is just a pub/sub implementation, you can listen for any arbitrary event name (ie. ones you might broadcast yourself later).

> :warning: &nbsp;**Warning:** Because the event names can be arbitrary, be careful not to make mistakes when subscribing or publishing to events &mdash; you won't get any warning you have done so.

If an event provides data, your callback will be passed one argument for each piece of data it provided. Note that there are lots of events that don't provide any data, so these callbacks won't take any arguments.

One nice feature of the `subscribe` method is that you can set the context of `this` when your callback is invoked:

```js
gd.event('/some/event/name').subscribe([callback, context]);
```

The object you provide as the value of `context` will become the value of `this` when the callback is triggered by an event broadcast. If you choose the use the `subscribe(callback)` format instead, the context will be be global (ie. `window`).

Even when a plugin reloads itself, the event names stay constant, so you don't need to worry about memory leaks with the callbacks. Regardless, if you do want to unsubcribe a plugin, you can do so by calling the `unsubscribe` method:

```js
gd.event('/some/event/name').subscribe(callback);
gd.event('/some/event/name').unsubscribe(callback);
```

You can remove multiple callbacks at once:

```js
gd.event('/some/event/name').unsubscribe(callback1, callback2, ...);
```

Note that `subscribe` and `unsubscribe` both return an object suitable for chaining with `broadcast`:

```js
gd.event('/some/event/name').broadcast().unsubscribe(callback);
```

### Broadcasting

Most of the plugins listen to events that are really only useful internally to the SDK. That said, if a plugin does listen for an event, it will be listed in [the documentation on the plugins](https://github.com/globaldawn/docs/blob/master/plugins/README.md).

As with subscribing to events, you can broadcast events with a similar code pattern:

```js
gd.event('/some/event/name').broadcast(arg1, arg2, ...);
```

You don't have to provide the `broadcast` method with any arguments if you don't want, but if you do they will be used as the arguments when calling any callbacks for the event you fire.

> :information_source: &nbsp;**Note:** The `broadcast` method is synchronous, which means that if there are a lot of callbacks, it won't pass control onto the next line of code until all the callbacks are finished.

Again, as with the `subscribe` and `unsubscribe` methods, `broadcast` returns an object suitable for chaining:

```js
gd.event('/some/event/name').subscribe(callback).broadcast();
```

## Next Steps

:checkered_flag: &nbsp;Now that your SDK is ready to run, move on to reading the [the documentation on the plugins](https://github.com/globaldawn/docs/blob/master/plugins/README.md) and add some declarative markup to your documents to test your setup.
