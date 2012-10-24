# The Global Dawn API Platform

This repository contains the documentation you will need to interface with the
Global Dawn API platform. We've split the docs up into sections, where each
section corresponds to a unique area of our platform. Use the list below to
find the specific docs you're looking for, or keep reading for an overview
of the platform.

## Documentation Table of Contents

We recommend that you read the following three piece of documentation when starting to work with the Global Dawn platform for the first time (preferably in the order given):

* [The JavaScript SDK](https://github.com/globaldawn/docs/blob/master/sdk/README.md)
* [The HTML Plugins](https://github.com/globaldawn/docs/blob/master/plugins/README.md)
* [The Backend APIs](https://github.com/globaldawn/docs/blob/master/apis/README.md)

This should give you a comprehensive set of usage instructions for the platform. For a higher level overview, see the following section.

## Quick Start

In order to get you up and running as quickly as possible, here's a checklist of tasks you need to complete to use the Global Dawn platform:

1. Add a valid domain in the Admin Manager. For example, if you are going to be using the platform on `example.com`, you need to add `example.com` to the domains in Admin Manager for the APIs and SDKs to work. Your Global Dawn account manager can give you assistance with this.
2. Set up a Facebook, Twitter, and/or Google app as required for your domain. Add the API keys for these apps to your account in the Admin Manager. Your Global Dawn account manager is able to help with this task.
3. Choose and setup a proxy implementation as described [in the SDK documentation](https://github.com/globaldawn/docs/blob/master/sdk/README.md). Test that the proxy is working before continuing by following the instructions in the SDK documentation.
4. Add as many plugins as you want from the list of available plugins [in the HTML Plugins documentation](https://github.com/globaldawn/docs/blob/master/plugins/README.md).
5. (Optional) Read and implement server to server APIs as required, which you'll find detailed [in the API documentation](https://github.com/globaldawn/docs/blob/master/apis/README.md).

## Example Site

As you read along with these docs, it's useful to have a visual example for reference. You can view an example of all plugins at the following URL: https://api-example-client.globaldawn.com/

## Overview

The Global Dawn platform allows you to enrich your customer's experience by applying our intelligent relationship, content and interest graph to their user journey. Through the simple use of a few tools, you can customise the experience for a customer to their personal preferences &mdash; the result is mesurable value: new customers, activated users, better retention, more referrals and new revenue.

### The JavaScript SDK

The first step to applying our services to your site is through the use of the JavaScript SDK. This toolkit, when loaded on your site, searches for any of the numerous HTML plugins that we offer and loads them. The installation, configuration and initialisation of the SDK is simple: with a few lines of JavaScript, you can have social registration on your site in minutes &mdash; or perhaps, you wish to add social bookmarking, which can also be added in just as short a time.

### The HTML Plugins

The SDK looks through any HTML document it's loaded within for some special markup that indicates a plugin should be loaded. You can add as many plugins as you want, and for each, the markup is simple and concise. The net result is that in minutes, you can add services to your site that are rich and well tested &mdash; and in most cases, it's a single line of HTML!

### The Backend APIs

The plugins, when started by the SDK, need to communicate with our platform to access our graph data. It does this by talking to our back-end APIs through a small proxy script located on your server.

We make available a large number of extra APIs that can be called server-side by your website for increased integration. These are well documented and tested, and can give you access to a rich set of data or services to work with your users and their interactions with your site.

### The Admin Manager

The Admin Manager is a web based interface where developers and non developers in your organisation can configure the services used, as well as view reports.

As a developer, you will use it for the following: setting up your domains, providing Global Dawn with your social network keys, finding your Global Dawn API keys, setting up call back URLs, setting up service messages (e.g. registration confirmation emails). See more details [on our support page](http://support.globaldawn.com).

Your Global Dawn account manager can provide you with a login or if a colleague of yours has already got one, they should invite you to get your own account (from the 'Settings > Account Users' section of the Admin Manager).

## Notes on the Documentation

The main documentation is referenced above, where you'll find links to Markdown files with the specifics on our platform. In addition, there's an `examples/` directory inside of which you'll find some sample code. We encourage you to fork this repository to try this code out, and submit pull requests to add interesting examples of your own!

## Help Us Make It Better

This documentation is always evolving. We encorage you to submit pull requests and issues if you notice mistakes, or have questions regarding an API, a plugin or the SDK. We'll endeavour to merge any pull requests as soon as possible (nice code permitting!)

## License

Copyright (c) 2012, Global Dawn.

Some other license information here.
