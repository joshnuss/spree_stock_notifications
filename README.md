Spree Stock Notifications
=======================

Get email notifications when:

 - an item is running low on stock
 - an item goes out of stock

Installation
------------

Add spree_stock_notifications to your Gemfile:

```ruby
gem 'spree_stock_notifications'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_stock_notifications:install
```

Configure notification settings `config/initializers/spree_stock_notifications.rb`

```ruby
Spree.config do |config|
  admin_emails = Spree::Role.find_by_name('admin').users.map(&:email).join(',')

  # comma separated list of emails
  config.stock_notifications_list = admin_emails

  # when stock level reaches the "low stock threshold", admins will be notified. Default is 1
  config.low_stock_threshold = 2
end
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

Joshua Nussbaum is a Freelance Software Consultant. You can reach me at joshnuss@gmail.com

Copyright (c) 2014 Joshua Nussbaum, released under the New BSD License
