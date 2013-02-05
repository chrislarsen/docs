#!/usr/bin/env bash

sed -i -e 's%http://localhost.1-9-90.net:1339%'${1}'%' index.html start-sdk.js login-done.html social-recs.html product-reviews.html
sed -i -e 's%http://localhost.1-9-90.net:1337%'${2}'%' index.html start-sdk.js login-done.html social-recs.html product-reviews.html

