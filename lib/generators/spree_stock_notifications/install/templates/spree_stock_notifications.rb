Spree.config do |config|
  # create a list of admin emails
  if ENV['RAILS_ENV'] == 'test'
    admin_emails = "john@example.com, jane@example.com"
  else
    admin_role   = Spree::Role.find_by_name('admin')
    admin_emails = admin_role.users.map(&:email).join(',')
  end

  # set comma separated list of emails
  config.stock_notifications_list = admin_emails

  # when stock level reaches the "low stock threshold", admins will be notified. Default is 1
  config.low_stock_threshold = 2
end
