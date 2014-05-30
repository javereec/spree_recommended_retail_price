module Spree
  Product.class_eval do
    delegate_belongs_to :master, :recommended_retail_price
    delegate_belongs_to :master, :visible_customer_discount
  end
end