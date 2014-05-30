module Spree
  Variant.class_eval do
    validates :recommended_retail_price, numericality: { greater_than: 0, allow_nil: true }

    # Alias attributes for easy access
    # You have to use original column name when searching though
    alias_attribute :rrp=, :recommended_retail_price=
    alias_attribute :msrp=, :recommended_retail_price=
    alias_attribute :rrp, :recommended_retail_price
    alias_attribute :msrp, :recommended_retail_price

    # Method that outputs the discount percentage vs the recommended retail price
    # Outputs 0 except if recommended_retail_price > 0 to avoid displaying nonsensical values
    def visible_customer_discount
      discount = 0.0
      if recommended_retail_price && recommended_retail_price > price
        discount = (recommended_retail_price - price) / recommended_retail_price
      end
      discount
    end
  end
end
