require 'spec_helper'

describe Spree::StockItem, type: :model do
  let(:variant) { create(:variant) }
  let(:stock_item) { variant.stock_items.first}
  let(:mail) { double(:mail) }

  it "sends notification when out of stock" do
    expect(StockMailer).to receive(:low_stock).once.with(stock_item).and_return(mail)
    expect(mail).to receive(:deliver_later)

    stock_item.adjust_count_on_hand(10)
    stock_item.adjust_count_on_hand(-5)
    stock_item.adjust_count_on_hand(-5)
  end

  it "sends notification when low stock" do
    Spree::Config.low_stock_threshold = 5

    expect(StockMailer).to receive(:low_stock).once.with(stock_item).and_return(mail)
    expect(mail).to receive(:deliver_later)

    stock_item.adjust_count_on_hand(10)
    stock_item.adjust_count_on_hand(-3)
    stock_item.adjust_count_on_hand(-4)
  end

  it "doesnt sends notification when low stock threshold is nil" do
    Spree::Config.low_stock_threshold = nil

    expect(StockMailer).not_to receive(:low_stock)

    stock_item.adjust_count_on_hand(10)
    stock_item.adjust_count_on_hand(-3)
    stock_item.adjust_count_on_hand(-4)
  end
end
