# The HTML Plugins

## Prerequisites

In order to use the plugins, you need to have the JavaScript SDK loaded, configured, and initialised. You can do that by following the instructions in the [documentation on the SDK](https://github.com/globaldawn/docs/blob/master/sdk/README.md).

If the SDK fails to load for any reason, the plugins will gracefully degrade &mdash; they are all written as empty tags with declarative attributes, so they'll just be left as empty nodes in the DOM.

## The Markup

All plugins are generally written as simple `<div>` tags with [data attributes](http://dev.w3.org/html5/spec/global-attributes.html#embedding-custom-non-visible-data-with-the-data-*-attributes) on them that define what sort of plugin should be loaded. A plugin may have some options that can be set, which are also defined using data attributes.

> :information_source: &nbsp;**Note:** There is no limitation on what type of tag you can actually use &mdash; whilst we use `<div>` tags in all of our examples, if you have a tag that is more semantically correct that you wish you use, you can. The only requirement is that you have the correct attributes on the tag.

## The Plugins

### Social Registration and Sharing

#### Login

##### Facebook Login

```html
<div data-gd-plugin="fb-login"></div>
```

Options:

* `data-gd-popup`, default `"true"`: Whether to show the login in a popup window. If set to `"false"`, it will redirect the entire current window to the login provider. If this option is set to `"false"`, you must set the `"data-gd-success-redirect"` and `"data-gd-failure-redirect"` properties.
* `data-gd-success-redirect`: A fully qualified URL to redirect to if the login process succeeds. This only has an effect if `data-gd-popup` is set to `"false"`.
* `data-gd-failure-redirect`: A fully qualified URL to redirect to if the login process fails. This only has an effect if `data-gd-popup` is set to `"false"`.

##### Twitter Login

```html
<div data-gd-plugin="tw-login"></div>
```

##### User Status

```html
<div data-gd-plugin="user-status"></div>
```

##### All

```html
<div data-gd-plugin="all-login"></div>
```

#### Bookmark

##### Facebook

```html
<div data-gd-plugin="fb-bookmark"></div>
```

##### Twitter

```html
<div data-gd-plugin="tw-bookmark"></div>
```

##### All

```html
<div data-gd-plugin="all-bookmark"></div>
```

#### Share

##### Facebook

```html
<div data-gd-plugin="fb-share"></div>
```

##### Twitter

```html
<div data-gd-plugin="tw-share"></div>
```

##### All

```html
<div data-gd-plugin="all-share"></div>
```
