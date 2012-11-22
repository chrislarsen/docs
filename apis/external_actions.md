# External Actions API's

## Introduction

As well as providing insight into the activities of users in relation to our plugins Global Dawn allows you to track, analyse and react to events throughout your system.

## Prerequisites

Global Dawn supports a number of event types for which no prerequisite work is required. We also support custom actions which you will need to create in the Admin Manager before using these apis.

## Shared API conventions 

> :information_source: &nbsp;**Note:** these API's require a POST request and [secret key signing](https://github.com/globaldawn/docs/blob/master/apis/secret_key_signing.md).

### Pre-Configured Action Types

#### BUY

API Path: /apis/behaviour/actions/BUY

Parameters:

| Name | Description | Valid Values |
|------|-------------|--------------|
| userId | The GD User Id for the user who performed the action | A valid Global Dawn user Id |
| amount | The purchase Amount | Any positive decimal value |
| currency | the code of the currency the purchase was performed in | Any valid ISO 4217 value |
| transactionId | An identifier uniquely identifying this transaction in your system | any unique identifier |

### Custom Action Types

> :information_source: &nbsp;**Note:** this api path can only be used with values you have configured in the admin manager. The full api path for each action is displayed in the admin manager.

API Path: /apis/behaviour/actions/[your_action]

Parameters:

| Name | Description | Valid Values |
|------|-------------|--------------|
| userId | The GD User Id for the user who performed the action | A valid Global Dawn user Id |


Any other parameters which are supplied will be stored as part of the custom action for future analysis.
