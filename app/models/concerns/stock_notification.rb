module StockNotification
  extend ActiveSupport::Concern

  included do
    around_save :notify_out_of_stock
    around_save :notify_low_stock
  end

private
  def notify_out_of_stock
    out_of_stock = crossed(0)
    yield
    StockMailer.out_of_stock(self).deliver if out_of_stock
  end

  def notify_low_stock
    low_stock = crossed(Spree::Config.low_stock_threshold)
    yield
    StockMailer.low_stock(self).deliver if low_stock
  end

  def crossed(threshold)
    threshold && count_on_hand_changed? && count_on_hand <= threshold && count_on_hand_was > threshold
  end
end
