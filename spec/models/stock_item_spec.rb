require 'spec_helper'

describe Spree::StockItem do
  let(:variant) { create(:variant) }
  let(:stock_item) { variant.stock_items.first}
  let(:mail) { double(:mail) }

  it "sends notification when out of stock" do
    StockMailer.should_receive(:out_of_stock).once.with(stock_item).and_return(mail)
    mail.should_receive(:deliver)

    stock_item.adjust_count_on_hand(10)
    stock_item.adjust_count_on_hand(-5)
    stock_item.adjust_count_on_hand(-5)
  end

  it "sends notification when low stock" do
    Spree::Config.low_stock_threshold = 5

    StockMailer.should_receive(:low_stock).once.with(stock_item).and_return(mail)
    mail.should_receive(:deliver)

    stock_item.adjust_count_on_hand(10)
    stock_item.adjust_count_on_hand(-3)
    stock_item.adjust_count_on_hand(-4)
  end

  it "doesnt sends notification when low stock threshold is nil" do
    Spree::Config.low_stock_threshold = nil

    StockMailer.should_not_receive(:low_stock)

    stock_item.adjust_count_on_hand(10)
    stock_item.adjust_count_on_hand(-3)
    stock_item.adjust_count_on_hand(-4)
  end
end
