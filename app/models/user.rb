class User < ActiveRecord::Base
  attr_accessible :email, :password, :subscription_ids, :remember_token
  has_many :user_subscriptions, :inverse_of => :user
  has_many :subscriptions, :through => :user_subscriptions, :source =>
           :subscription_plan
  has_many :newspapers, :through => :subscriptions
end
