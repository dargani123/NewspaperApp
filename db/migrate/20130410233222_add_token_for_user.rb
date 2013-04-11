class AddTokenForUser < ActiveRecord::Migration
  def change
    add_column :users, :remember_token, :integer
  end
end
