# The HTML Plugins

## Prerequisites

In order to use the plugins, you need to have the JavaScript SDK loaded, configured, and initialised. You can do that by following the instructions in the [documentation on the SDK](https://github.com/globaldawn/docs/blob/master/sdk/README.md).

If the SDK fails to load for any reason, the plugins will gracefully degrade &mdash; they are all written as empty tags with declarative attributes, so they'll just be left as empty nodes in the DOM.

## The Markup

All plugins are generally written as simple `<div>` tags with [data attributes](http://dev.w3.org/html5/spec/global-attributes.html#embedding-custom-non-visible-data-with-the-data-*-attributes) on them that define what sort of plugin should be loaded. A plugin may have some options that can be set, which are also defined using data attributes.

> :information_source: &nbsp;**Note:** There is no limitation on what type of tag you can actually use &mdash; whilst we use `<div>` tags in all of our examples, if you have a tag that is more semantically correct that you wish you use, you can. The only requirement is that you have the correct attributes on the tag.

An example of a simple plugin is as follows:

```html
<div data-gd-plugin="facebook-login"></div>
```

This would start up the `facebook-login` plugin. This particular plugin can also take some options, so here's an example with one of them provided:

```html
<div data-gd-plugin="facebook-login" data-gd-popup="false" data-gd-success-redirect="http://foo.com/bar" data-gd-failure-redirect="http://foo.com/moo"></div>
```

Note that every single declarative attribute we add is prefixed with `data-gd` &mdash; the `data-` part is mandated by the HTML5 specification, and the `gd-` part is our namespace to ensure we don't clash with any other data attributes.

You can add any other attributes to the plugin node as you wish &mdash; ID and class attributes are fine, along with other data attributes that aren't used by plugin you are attaching them to. This means you should still have full control over the markup.

### Groups and Group Members

Some plugins are "groups" &mdash; this means that when they are encountered in the DOM, they are replaced with several plugins, one for each member of that group.

In the documentation below, you'll see at the beginning of each plugin's section some information on what groups a plugin belongs to, or if the plugin in question is a group, what plugins are inside that group.

Note that when data attributes are set on a group, they are given to all of the plugins inside that group; because any unknown attributes are ignored by plugins, you can safely mix attributes for multiple plugins on the group node.

### Common Events

All plugins broadcast or listen to some common events that the SDK itself is in charge of. These are, in no particular order:

| name | description | arguments |
|------|-------------|-----------|
| `/gd/plugin/loaded/<group>` | This event is fired once for each group that a plugin belongs to. A plugin internally listens to this iself to know when it's markup is ready so it can do any initialisation it needs to do. You can use this event to perform an action when a plugin is ready. | One arguments: a reference to the plugin that was loaded. |

For brevity, these common events are not listed again under each plugin below.

## The Plugins

### Facebook Login

> **ID:** `facebook-login`
> **Groups:** `login`
> **Pack:** Social Registration and Sharing

A button that allows the user to login with Facebook. If the user is already logged in, the plugin will be empty until they log out.

**Example:**

```html
<div data-gd-plugin="facebook-login"></div>
```

**Options:**

| name | default | description |
|------|---------|-------------|
|`data-gd-popup` | `"true"` | Whether to show the login in a popup window. If set to `"false"`, it will redirect the entire current window to the login provider. If this option is set to `"false"`, you must set the `"data-gd-success-redirect"` and `"data-gd-failure-redirect"` properties. |
| `data-gd-success-redirect` | none | A fully qualified URL to redirect to if the login process succeeds. This only has an effect if `data-gd-popup` is set to `"false"`. |
| `data-gd-failure-redirect` | none | A fully qualified URL to redirect to if the login process fails. This only has an effect if `data-gd-popup` is set to `"false"`. |

**Broadcasted Events:**

| name | description | arguments |
|------|-------------|-----------|
| `/gd/user/login/success` | Broadcasted when a user successfully signs in using this plugin.| none |
| `/gd/user/login/failure` | Broadcasted when a user fails to sign in using this plugin. | none |

**Subscribed Events:**

| name | description | arguments |
|------|-------------|-----------|
| `/gd/user/logout` | Subscribes to this so it can show and hide the login buttons on change of the user's status. | none |
| `/gd/user/login/success` | Subscribes to this so it can show and hide the login buttons on change of the user's status | none |
| `/gd/user/login/failure` | Subscribes to this so it can show and hide the login buttons on change of the user's status. | none |

---

### Twitter Login

> **ID:** `twitter-login`
> **Groups:** `login`
> **Pack:** Social Registration and Sharing

A button that allows the user to login with Twitter. If the user is already logged in, the plugin will be empty until they log out.

**Example:**

```html
<div data-gd-plugin="twitter-login"></div>
```

**Options:**

| name | default | description |
|------|---------|-------------|
|`data-gd-popup` | `"true"` | Whether to show the login in a popup window. If set to `"false"`, it will redirect the entire current window to the login provider. If this option is set to `"false"`, you must set the `"data-gd-success-redirect"` and `"data-gd-failure-redirect"` properties. |
| `data-gd-success-redirect` | none | A fully qualified URL to redirect to if the login process succeeds. This only has an effect if `data-gd-popup` is set to `"false"`. |
| `data-gd-failure-redirect` | none | A fully qualified URL to redirect to if the login process fails. This only has an effect if `data-gd-popup` is set to `"false"`. |

**Broadcasted Events:**

| name | description | arguments |
|------|-------------|-----------|
| `/gd/user/login/success` | Broadcasted when a user successfully signs in using this plugin.| none |
| `/gd/user/login/failure` | Broadcasted when a user fails to sign in using this plugin. | none |

**Subscribed Events:**

| name | description | arguments |
|------|-------------|-----------|
| `/gd/user/logout` | Subscribes to this so it can show and hide the login buttons on change of the user's status. | none |
| `/gd/user/login/success` | Subscribes to this so it can show and hide the login buttons on change of the user's status | none |
| `/gd/user/login/failure` | Subscribes to this so it can show and hide the login buttons on change of the user's status. | none |

---

### Google Login

> **ID:** `google-login`
> **Groups:** `login`
> **Pack:** Social Registration and Sharing

A button that allows the user to login with a Google account. If the user is already logged in, the plugin will be empty until they log out.

**Example:**

```html
<div data-gd-plugin="google-login"></div>
```

**Options:**

| name | default | description |
|------|---------|-------------|
|`data-gd-popup` | `"true"` | Whether to show the login in a popup window. If set to `"false"`, it will redirect the entire current window to the login provider. If this option is set to `"false"`, you must set the `"data-gd-success-redirect"` and `"data-gd-failure-redirect"` properties. |
| `data-gd-success-redirect` | none | A fully qualified URL to redirect to if the login process succeeds. This only has an effect if `data-gd-popup` is set to `"false"`. |
| `data-gd-failure-redirect` | none | A fully qualified URL to redirect to if the login process fails. This only has an effect if `data-gd-popup` is set to `"false"`. |

**Broadcasted Events:**

| name | description | arguments |
|------|-------------|-----------|
| `/gd/user/login/success` | Broadcasted when a user successfully signs in using this plugin.| none |
| `/gd/user/login/failure` | Broadcasted when a user fails to sign in using this plugin. | none |

**Subscribed Events:**

| name | description | arguments |
|------|-------------|-----------|
| `/gd/user/logout` | Subscribes to this so it can show and hide the login buttons on change of the user's status. | none |
| `/gd/user/login/success` | Subscribes to this so it can show and hide the login buttons on change of the user's status | none |
| `/gd/user/login/failure` | Subscribes to this so it can show and hide the login buttons on change of the user's status. | none |

---

### User Status

> **ID:** `user-status`
> **Groups:** `login`
> **Pack:** Social Registration and Sharing

If the user is logged in, this plugin will show their avatar, and links to logout or edit their profile. If the user is logged out, this plugin will be empty until they log in.

**Example:**

```html
<div data-gd-plugin="user-status"></div>
```

**Options:**

| name | default | description |
|------|---------|-------------|
|`data-gd-popup` | `"true"` | Whether to show the login in a popup window. If set to `"false"`, it will redirect the entire current window to the login provider. If this option is set to `"false"`, you must set the `"data-gd-success-redirect"` and `"data-gd-failure-redirect"` properties. |
| `data-gd-success-redirect` | none | A fully qualified URL to redirect to if the login process succeeds. This only has an effect if `data-gd-popup` is set to `"false"`. |
| `data-gd-failure-redirect` | none | A fully qualified URL to redirect to if the login process fails. This only has an effect if `data-gd-popup` is set to `"false"`. |

**Broadcasted Events:**

| name | description | arguments |
|------|-------------|-----------|
| `/gd/user/login/success` | Broadcasted when a user successfully signs in using this plugin.| none |
| `/gd/user/login/failure` | Broadcasted when a user fails to sign in using this plugin. | none |

**Subscribed Events:**

| name | description | arguments |
|------|-------------|-----------|
| `/gd/user/logout` | Subscribes to this so it can show and hide the login buttons on change of the user's status. | none |
| `/gd/user/login/success` | Subscribes to this so it can show and hide the login buttons on change of the user's status | none |
| `/gd/user/login/failure` | Subscribes to this so it can show and hide the login buttons on change of the user's status. | none |

---

### All Login

> :link: &nbsp;**Group Plugin**: This is a group plugin, so for the options and events that this plugin uses, see the documentation for the members of this group.

> **ID:** `all-login`
> **Group members:** `facebook-login`, `twitter-login`, `google-login`, `user-status`
> **Pack:** Social Registration and Sharing

This plugin renders the Facebook Login, Twitter Login, and User Status plugins using a single piece of declarative markup. Any options you set on this plugin are effectively passed through to the other plugins it starts up.

**Example:**

```html
<div data-gd-plugin="all-login"></div>
```

---

### Facebook Bookmark

> **ID:** `facebook-bookmark`
> **Groups:** `bookmark`
> **Pack:** Social Registration and Sharing

**Example:**

```html
<div data-gd-plugin="facebook-bookmark"></div>
```

**Options:**

| name | default | description |
|------|---------|-------------|
| `data-gd-facebook-url` | The current page URL | The URL that will be bookmarked when the button is clicked. |
| `data-gd-facebook-width` | `"450"` | The width of the button. |
| `data-gd-facebook-show-faces` | `"true"` | Whether to show avatars of friends below the share button for a logged in useri (this only shows when `data-gd-facebook-layout` is set to `"standard"`). |
| `data-gd-facebook-layout`| `"standard"` | The layout of the like button. Possible values are `"standard"` (displays test to the right of the button, and faces below), `"button_count"` (displays total number of likes to the right of the button), and `"box_count"` (displays total number of likes in a callout above the button). |
| `data-gd-facebook-action` | `"like"` | The verb to display on the button. valid options are `"like"` and `"recommend"`.
| `data-gd-facebook-colorscheme` | `"light"` | The colour scheme for the button. Valid options are `"light"` and `"dark"`.
| `data-gd-facebook-font` | none | Sets the font for the button. Valid options are `"arial"`, `"lucida grande"`, `"segoe ui"`, `"tahoma"`, `"trebuchet ms"` and `"verdana"` |

**Broadcasted Events:** None

**Subscribed Events:** None

---

### Twitter Bookmark

> **ID:** `twitter-bookmark`
> **Groups:** `bookmark`
> **Pack:** Social Registration and Sharing

**Example:**

```html
<div data-gd-plugin="twitter-bookmark"></div>
```

**Options:**

| name | default | description |
|------|---------|-------------|
| `data-gd-twitter-url` | The current page URL | The URL that will be bookmarked when the button is clicked. |
| `data-gd-twitter-via` | none | The Twitter username to attribute the tweet to. |
| `data-gd-twitter-text` | none | Some text to prefill the tweet box with. |
| `data-gd-twitter-related` | none | Related accounts to recommend the user to follow after tweeting. |
| `data-gd-twitter-count` | none | The position of the total tweet count. |
| `data-gd-twitter-lang` | none | The language to use for the tweet button. |
| `data-gd-twitter-hashtags` | none | Comma separated hashtags to append to the tweet. |
| `data-gd-twitter-size` | none | The size of the button. |
| `data-gd-twitter-dnt` | none | Whether to turn on the DNT header to opt users out of content personalisation. |

**Broadcasted Events:** None

**Subscribed Events:** None

---

### All Bookmark

> :link: &nbsp;**Group Plugin**: This is a group plugin, so for the options and events that this plugin uses, see the documentation for the members of this group.

> **ID:** `all-bookmark`
> **Group members:** `facebook-bookmark`, `twitter-bookmark`
> **Pack:** Social Registration and Sharing

**Example:**

```html
<div data-gd-plugin="all-bookmark"></div>
```

---

### Facebook Share

> **ID:** `facebook-share`
> **Groups:** `share`
> **Pack:** Social Registration and Sharing

**Example:**

```html
<div data-gd-plugin="facebook-share"></div>
```

**Options:**

| name | default | description |
|------|---------|-------------|

**Broadcasted Events:** None

**Subscribed Events:** None

---

### Twitter Share

> **ID:** `twitter-share`
> **Groups:** `share`
> **Pack:** Social Registration and Sharing

**Example:**

```html
<div data-gd-plugin="twitter-share"></div>
```

**Options:**

| name | default | description |
|------|---------|-------------|

**Broadcasted Events:** None

**Subscribed Events:** None

---

### All Share

> :link: &nbsp;**Group Plugin**: This is a group plugin, so for the options and events that this plugin uses, see the documentation for the members of this group.

> **ID:** `all-share`
> **Group members:** `facebook-share`, `twitter-share`
> **Pack:** Social Registration and Sharing

**Example:**

```html
<div data-gd-plugin="all-share"></div>
```
