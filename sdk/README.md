# The JavaScript SDK

## Prerequisites

### Setting Up The Proxy

In order to communicate with the APIs without exposing the API to prying eyes, the SDK requires a very basic reverse proxy to be set up through which it can call the back-end. To make this process as simple as possible, [we provide a set of example implementations](https://github.com/esp/api-example-proxy) in a wide variety of languages or configurations.

We strongly recommend tha you use the Nginx, Apache, or other web server versions where possible &mdash; these are much faster than the alternatives by an order of magnitude.

#### Writing Your Own Proxy Implementation

#### Configuring The Proxy

## Loading The SDK

You can load the SDK by simply adding the following script tag in the `<head>` of your documentes:

```html
<script src="http://static-nocdn.globaldawn.co/js/gd-sdk-bootstrap.js"></script>
```

This is a very small JavaScript file that should not cached. It loads the actual SDK from our CDN, making sure the delivery to the client is as fast as possible but ensuring updates are timely.

## Configuring The SDK

Without configuring the SDK, none of your widgets will load on the page. When the SDK is loaded, it calls a function on the `window` object, so define this callback:

```js
window.gdLoaded = function(gd) {
  //
};
```

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
* `loadStylesheets`, `Boolean`, default `true`: Set this to false to disable the loading of any stylesheets for the plugins. This allows you to completely control the look and feel of any widgets.

The return value of `gd.init` is a "promise", which means you can add a callback for when this promised data is finished fetching by calling the `then` function as in the above example.

Onwards into this documentation, any code we give examples for should be assumed to be in this  callback unless otherwise explicitly mentioned.

## Declarative Markup

## Listening For Events
