module SpreeStockNotifications
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def add_initializer
        copy_file 'spree_stock_notifications.rb', 'config/initializers/spree_stock_notifications.rb'
      end
    end
  end
end
