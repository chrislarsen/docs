# The Social Login API's

## Introduction

Global Dawn's social login API's are designed to allow easy integration with multiple authentication systems. We abstract away the complexity and differences between vendors and expose a clean and easy to use API.

## Preprequisites

The utilise our social login API's, you must ensure that you have configured your social network API keys in
the admin manager.

## Shared API conventions and properties

> :information_source: &nbsp;**Note:** these login API's must be called by the client browser via the proxy path you should have already configured.

To initiate a login, ensure that the browser makes a GET request to one the API endpoints listed below. This can be done with
a simple `<a href="...API...">`, or via a 302 redirection.

All login API's support a range of common properties. These should be specified as query parameters.

| name | required | default | supported values | description |
|------|----------|---------|------------------|-------------|
| `popup` | no | false | "true" or "false" | Determines if the login should occur within a popup, or if the login flow will occur by redirecting the current page |
| `cssPath` | no | none | A fully qualified URL to a custom CSS file. For logins which include partial registration, this file is loaded instead of the default Globaldawn stylesheet |
| `successRedirect` | no | none | A fully qualified URL to redirect to once the login processes has completed successfully |
| `failureRedirect` | no | none | A fully qualified URL to redirect to if the login process fails |

### Supported login mechanisms

| API path | Description |
|----------|-------------|
| `/apis/social/login/facebook` | Initate a Facebook login |
| `/apis/social/login/twitter` | Initiate a Twitter login |
| `/apis/social/login/google` | Initiate a Google login |
