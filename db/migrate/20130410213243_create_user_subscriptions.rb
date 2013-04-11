class CreateUserSubscriptions < ActiveRecord::Migration
  def change
    create_table :user_subscriptions do |t|
      t.references   :user
      t.references :subscription_plan

      t.timestamps
    end
    add_index :user_subscriptions, :subscription_plan_id
  end
end
