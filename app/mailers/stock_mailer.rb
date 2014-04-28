class StockMailer < Spree::BaseMailer
  def out_of_stock(stock_item)
    default_mail(stock_item)
  end

  def low_stock(stock_item)
    default_mail(stock_item)
  end

private

  def default_mail(stock_item, options = {})
    @stock_item = stock_item
    @variant = stock_item.variant
    @product = stock_item.variant.product

    if @variant.is_master
      @url = spree.admin_product_variant_url(@product, @variant)
    else
      @url = spree.admin_product_url(@product)
    end

    mail({from: from_address, to: Spree::Config.stock_notifications_list}.merge(options))
  end

end
