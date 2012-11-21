# Secret Key Signing

Some APIs require your HTTP request to be "signed". In terms of the Global Dawn API, this means the following:

* Your request must contain the `X-GD-API-Timestamp` and `X-GD-API-Token` headers, in addition to the normal `X-GD-API-Key` header.
* The value of the `X-GD-API-Timestamp` header should be the current UNIX epoch in seconds.
* The value of the `X-GD-API-Token` should be the value of the following pseudocode `sha1(api_path + secret_key + timestamp)`, where `api_path` is the path including any query string value of the API request being made, `secret_key` is the value of the client secret key as available from the Global Dawn Admin Manager tool, and `timestamp` is the same timestamp as used in the `X-GD-API-Timestamp` header.

If any issue is encountered with the values of these headers, the request will be rejected with a friendly error and HTTP status to ensure the reason why the request was rejected is clear.

Any APIs that require signing will be clearly marked, and will link to this page for implementation details.
