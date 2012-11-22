# The Ratings and Reviews API's (Currently unsupported)

## Introduction

Global Dawn's ratings and reviews API's are designed to provide easy integration with our customer ratings and product reviews system.

## Preprequisites

The utilise our ratings and reviews API's, you must ensure that you have configured your corresponding API keys in
the admin manager.

## The Endpoints

The following endpoints are supported by the ratings and review API:

### Create Review Template

**Description**

Creates a review form template

**API path**

`http://host:port/clients/<client_id>/reviews/templates/`

**Payload**

```json
{
   "name":"Review Configuration",
   "description":"User Review Form",
   "allow_unregistered_reviews":"true",
   "component_templates":[
      {
         "type":"TEXT",
         "character_limit":30,
         "included_in_summary_view":true
      },
      {
         "type":"ANONYMOUS",
         "label":"I want to use a nickname or anonymously submit my review",
         "instructional_text":"Provide a nick name"
      }
   ]
}
```

**Response**

```json
{
   "id":"<id>",
   "client_id":"<client_id>",
   "name":"Review Configuration",
   "description":"User Review Form",
   "allow_unregistered_reviews":true,
   "component_templates":[
      {
         "type":"TEXT",
         "id":"<id>",
         "mandatory":false,
         "included_in_summary_view":true,
         "type":"TEXT",
         "multi_line":false,
         "character_limit":30,
         "number_of_characters_in_summary_view":0,
         "component_type":"TEXT",
         "render_type":"TEXT"
      },
      {
         "type":"ANONYMOUS",
         "id":"<id>",
         "label":"I want to use a nickname or anonymously submit my review",
         "instructional_text":"Provide a nick name",
         "mandatory":false,
         "included_in_summary_view":false,
         "type":"ANONYMOUS",
         "component_type":"ANONYMOUS",
         "render_type":"ANONYMOUS"
      }
   ]
}
```

### Product Review List

**Description**

Retrieves the list of user reviews for a partcular product.

**API path**

`http://host:port/clients/<client_id>/reviews/<template_id>/item/<product_id>?sortType=MOST_RECENT&count=10&offset=0`

**Payload** none

**Response**

```json
{
   "entities":[
      {
         "id":"<review_id>",
         "client_id":"<client_id>",
         "review_template_id":"<template_id>",
         "item_id":"item_1",
         "user_id":"<user_id>",
         "created_on":"2012-11-19T15:55:42Z",
         "components":[
            {
               "type":"STARS_RATING",
               "component_template_id":"<component_template_id>",
               "label":"My Rating",
               "rating":2,
             },
            {
               "type":"TEXT",
               "component_template_id":"<component_template_id>",
               "label":"My Comments",
               "text":"Aenean fermentum, elit eget tincidunt condimentum",
            }
         ]
      }
   ],
   "total":11,
   "offset":0
}
```

### Create User Review

**Description**

Creates a user review for a given product

**API path**

`http://host:port/clients/<client_id>/reviews/<template_id>/item/<product_id>`

**Payload**

```json
{
   "review_template_id":"review_template_id",
   "item_id":"item_1",
   "components":[
      {
         "rating":"2",
         "component_template_id":"<component_template_id>",
         "type":"STARS_RATING"
      },
      {
         "text":"my review",
         "component_template_id":"<component_template_id",
         "type":"TEXT"
      }
   ]
}
```

**Response**

```json
{
   "id":"id",
   "client_id":"<client_id>",
   "review_template_id":"<template_id>",
   "item_id":"item_1",
   "created_on":"2012-11-20T18:04:04Z",
   "components":[
      {
         "type":"STARS_RATING",
         "component_template_id":"<component_template_id>",
         "rating":2,
         "type":"STARS_RATING"
      },
      {
         "type":"TEXT",
         "component_template_id":"<component_template_id>",
         "text":"my review",
         "type":"TEXT"
      }
   ]
}
```


