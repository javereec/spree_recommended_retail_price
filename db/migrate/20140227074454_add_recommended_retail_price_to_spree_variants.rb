class AddRecommendedRetailPriceToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :recommended_retail_price, :decimal, precision: 8, scale: 2
  end
end
