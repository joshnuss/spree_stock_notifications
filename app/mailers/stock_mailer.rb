class StockMailer < Spree::BaseMailer
  def out_of_stock(variant)
    stock_mail(variant, Spree::Config.out_of_stock_notification_emails)
  end

  def low_stock(variant)
    stock_mail(variant, Spree::Config.low_stock_notification_emails)
  end

  private

  def stock_mail(variant, recipients, options = {})
    @variant = variant
    @product = variant.product

    if @variant.is_master
      @url = spree.admin_product_variant_url(@product, @variant)
    else
      @url = spree.admin_product_url(@product)
    end

    mail({ from: from_address, to: recipients }.merge(options))
  end
end
