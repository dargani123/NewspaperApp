class ChangePriceToDecimal < ActiveRecord::Migration
  def change
    remove_column :subscription_plans, :price
    add_column :subscription_plans, :price, :decimal
  end
end
