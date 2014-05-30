require 'spec_helper'
require 'byebug'

module Spree
  describe Variant do
    let(:variant) { create(:variant) }

    context "validations" do
      it "is valid with recommended_retail_price nil" do
        variant.recommended_retail_price = nil
        variant.should be_valid
      end

      it "is valid with recommended_retail_price greater than 0" do
        variant.recommended_retail_price = 1.0
        variant.should be_valid
      end

      it "is invalid when recommended_retail_price = 0" do
        variant.recommended_retail_price = 0
        variant.should be_invalid
      end
    end

    context "#recommended_retail_price" do
      it "has an alias rrp" do
        variant.rrp = 1.0
        variant.recommended_retail_price.should == 1.0
        variant.rrp.should == 1.0
      end

      it "has an alias msrp" do
        variant.msrp = 1.0
        variant.recommended_retail_price.should == 1.0
        variant.msrp.should == 1.0
      end

      it "alias can be used when creating a variant" do
        params = attributes_for(:variant).merge({rrp: 14.99})
        variant = Spree::Variant.new(params)
        variant.recommended_retail_price.should == 14.99
      end
    end

    context "#visible_customer_discount" do
      context "recommended_retail_price > price" do
        it "returns discount value" do
          variant.price = 7.5
          variant.recommended_retail_price = 10.0
          variant.visible_customer_discount.should == 0.25
        end
      end

      context "recommended_retail_price =< price" do
        it "returns 0" do
          variant.price = 7.5
          variant.recommended_retail_price = 7.5
          variant.visible_customer_discount.should == 0.0
          variant.price = 7.5
          variant.recommended_retail_price = 5.0
          variant.visible_customer_discount.should == 0.0
        end
      end
    end
  end
end