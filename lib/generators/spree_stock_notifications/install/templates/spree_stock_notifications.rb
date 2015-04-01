Spree.config do |config|
  # ==> Stock Notifications List
  # Supply a comma-separated list of emails to get notifications:
  # config.stock_notifications_list = "jack@example.com,jill@example.com"

  # In a typical Spree app this can be accomplished with the following:
  # admin_role = Spree::Role.find_by_name('admin')
  # admin_emails = admin_role.users.map(&:email).join(',')
  # config.stock_notifications_list = admin_emails

  # ==> Low Stock Threshold
  # When stock level reaches the "low stock threshold", admins will be
  # notified. Default is 1.
  # config.low_stock_threshold = 1
end
