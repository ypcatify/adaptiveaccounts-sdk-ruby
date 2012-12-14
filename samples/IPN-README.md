IPN Overview :
------------
* PayPal Instant Notification is a call back system that will get initiated once a tranction is completed(eg: When
a PayPal account is created successfully).
* You will receive the transaction related ipn variables on your call back url that you have specified in your request.
* You have to send this ipn variable back to PayPal system for verification, Upon verification PayPal will send
a response string "VERIFIED" or "INVALID".
* PayPal will continuously resend this ipn, if a wrong ipn is sent.

Validate IPN data :
-----------------

Add the following line in IPN Listener to validate the data:

```ruby
if PayPal::SDK::Core::API::IPN.valid?(request.raw_post)  # return true or false
  # params contains the data
end
```

IPN variables :
--------------

[Transaction]
-------------
* notify_version
* verify_sign
* charset
* confirmation_code
* event_type
* account_key

[BuyerInfo]
-----------
* first_name
* last_name

* For a full list of ipn variables you need to check log file, that Ipn Listener is logging into.

IPN Reference :
--------------
* You can refer IPN getting started guide at [https://www.x.com/developers/paypal/documentation-tools/ipn/gs_IPN]

