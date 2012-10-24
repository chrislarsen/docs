# Asynchronous server to server callbacks

## Introduction

The Globaldawn platform supports a variety of callback API's which push data to your platform. The callback URL's can be configured in the Admin Manager.

## Conventions and rules

### Delivery
Callbacks are POSTed as a JSON document to your nominated URL. We do our best to deliver callback messages quickly, but the nature of server-to-server communication over the public Internet means that there are some important factors to keep in mind.

* A callback may, in some very rare circumstances, be delivered more than once. We consider a callback message to be delivered when we receive a status code from your server which is >= 200 and <= 400
* We will attempt to retry delivery of callback messages 10 times, with a delay of at least 5 seconds between attempts 
* If we are unable to deliver a callback message after 10 attempts, we will discard it

### Format
All callback messages are wrapped in a JSON envelope. This is show below and contains three fields:

* `type` - the message type
* `message` - the actual message
* `timestamp` - the number of milliseconds that have passed since January 1, 1970 00:00:00.000 GMT

```json
{
  "type" : "<API TYPE>",
  "message" : {

  },
  "timestamp" : 1350818885148
}
```

## Social Registration callbacks

These callbacks are available with the Social Registration and Sharing API pack.

### User Login
This callback is invoked when a user logs in.

```json
{
  "type" : "USER_LOGIN",
  "message" : {
    "user_id" : "50830be587f200febc7f5fac",
    "email_address" : "phil.messenger@globaldawn.com",
    "first_name" : "Phil",
    "last_name" : "Messenger",
    "custom_fields" : {
    }
  },
  "timestamp" : 1350818885148
}
```

### User Updates

This callback is invoked when a user profile is altered. The payload of the message field is the user's complete profile.

```json
{
  "type" : "USER_UPDATE",
  "message" : {
    "user_id" : "50830be587f200febc7f5fac",
    "email_address" : "phil.messenger@globaldawn.com",
    "first_name" : "Phil",
    "last_name" : "Messenger",
    "custom_fields" : {
    }
  },
  "timestamp" : 1350818885148
}
```

### User Logout
This callback is invoked when a user logs out.

```json
{
  "type" : "USER_LOGOUT",
  "message" : {
    "user_id" : "50830be587f200febc7f5fac"
  },
  "timestamp" : 1350818871965
}
```