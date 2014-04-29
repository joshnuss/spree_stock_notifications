Spree.config do |config|
  # create a list of admin emails
  admin_role   = Spree::Role.find_by_name('admin')
  admin_emails = admin_role.users.map(&:email).join(',')

  # set comma separated list of emails
  config.stock_notifications_list = admin_emails

  # when stock level reaches the "low stock threshold", admins will be notified. Default is 1
  config.low_stock_threshold = 2
end
