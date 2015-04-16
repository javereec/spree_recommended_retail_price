SpreeRecommendedRetailPrice
===========================

This gems adds the recommended retail price on each product/variant. This price can be accessed with:

* recommended_retail_price
* rrp
* msrp

Method `visible_customer_discount` can be used to display the discount percentage of the sold to price against the rrp.

Installation
------------

Add spree_recommended_retail_price to your Gemfile:

```ruby
gem 'spree_recommended_retail_price'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_recommended_retail_price:install
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_recommended_retail_price/factories'
```

Copyright (c) 2014 [name of extension creator], released under the New BSD License
