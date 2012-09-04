# The HTML Plugins

## Prerequisites

In order to use the plugins, you need to have the JavaScript SDK loaded, configured, and initialised. You can do that by following the instructions in the [documentation on the SDK](https://github.com/globaldawn/docs/blob/master/sdk/README.md).

If the SDK fails to load for any reason, the plugins will gracefully degrade &mdash; they are all written as empty tags with declarative attributes, so they'll just be left as empty nodes in the DOM.

## The Markup

All plugins are generally written as simple `<div>` tags with [data attributes](http://dev.w3.org/html5/spec/global-attributes.html#embedding-custom-non-visible-data-with-the-data-*-attributes) on them that define what sort of plugin should be loaded. A plugin may have some options that can be set, which are also defined using data attributes.

> :information_source: &nbsp;**Note:** There is no limitation on what type of tag you can actually use &mdash; whilst we use `<div>` tags in all of our examples, if you have a tag that is more semantically correct that you wish you use, you can. The only requirement is that you have the correct attributes on the tag.

An example of a simple plugin is as follows:



## The Plugins

### Social Registration and Sharing

#### Facebook Login

> _Plugin identifier:_ fb-login

A button that allows the user to login with Facebook. If the user is already logged in, the plugin will be empty until they log out.

**Example:**

```html
<div data-gd-plugin="fb-login"></div>
```

**Options:**

* `data-gd-popup`, default `"true"`: Whether to show the login in a popup window. If set to `"false"`, it will redirect the entire current window to the login provider. If this option is set to `"false"`, you must set the `"data-gd-success-redirect"` and `"data-gd-failure-redirect"` properties.
* `data-gd-success-redirect`: A fully qualified URL to redirect to if the login process succeeds. This only has an effect if `data-gd-popup` is set to `"false"`.
* `data-gd-failure-redirect`: A fully qualified URL to redirect to if the login process fails. This only has an effect if `data-gd-popup` is set to `"false"`.

#### Twitter Login

> _Plugin identifier:_ tw-login

A button that allows the user to login with Twitter. If the user is already logged in, the plugin will be empty until they log out.

**Example:**

```html
<div data-gd-plugin="tw-login"></div>
```

**Options:**

* `data-gd-popup`, default `"true"`: Whether to show the login in a popup window. If set to `"false"`, it will redirect the entire current window to the login provider. If this option is set to `"false"`, you must set the `"data-gd-success-redirect"` and `"data-gd-failure-redirect"` properties.
* `data-gd-success-redirect`: A fully qualified URL to redirect to if the login process succeeds. This only has an effect if `data-gd-popup` is set to `"false"`.
* `data-gd-failure-redirect`: A fully qualified URL to redirect to if the login process fails. This only has an effect if `data-gd-popup` is set to `"false"`.

#### User Status

> _Plugin identifier:_ user-status

If the user is logged in, this plugin will show their avatar, and links to logout or edit their profile. If the user is logged out, this plugin will be empty until they log in.

**Example:**

```html
<div data-gd-plugin="user-status"></div>
```

**Options:**

* `data-gd-popup`, default `"true"`: Whether to show the login in a popup window. If set to `"false"`, it will redirect the entire current window to the login provider. If this option is set to `"false"`, you must set the `"data-gd-success-redirect"` and `"data-gd-failure-redirect"` properties.
* `data-gd-success-redirect`: A fully qualified URL to redirect to if the login process succeeds. This only has an effect if `data-gd-popup` is set to `"false"`.
* `data-gd-failure-redirect`: A fully qualified URL to redirect to if the login process fails. This only has an effect if `data-gd-popup` is set to `"false"`.

#### All Login

> _Plugin identifier:_ all-login

This plugin renders the Facebook Login, Twitter Login, and User Status plugins using a single piece of declarative markup. Any options you set on this plugin are effectively passed through to the other plugins it starts up.

**Example:**

```html
<div data-gd-plugin="all-login"></div>
```

**Options:**

* `data-gd-popup`, default `"true"`: Whether to show the login in a popup window. If set to `"false"`, it will redirect the entire current window to the login provider. If this option is set to `"false"`, you must set the `"data-gd-success-redirect"` and `"data-gd-failure-redirect"` properties.
* `data-gd-success-redirect`: A fully qualified URL to redirect to if the login process succeeds. This only has an effect if `data-gd-popup` is set to `"false"`.
* `data-gd-failure-redirect`: A fully qualified URL to redirect to if the login process fails. This only has an effect if `data-gd-popup` is set to `"false"`.

#### Facebook Bookmark

```html
<div data-gd-plugin="fb-bookmark"></div>
```

#### Twitter Bookmark

```html
<div data-gd-plugin="tw-bookmark"></div>
```

#### All Bookmark

```html
<div data-gd-plugin="all-bookmark"></div>
```

#### Facebook Share

```html
<div data-gd-plugin="fb-share"></div>
```

#### Twitter Share

```html
<div data-gd-plugin="tw-share"></div>
```

#### All Share

```html
<div data-gd-plugin="all-share"></div>
```
