class SubscriptionPlan < ActiveRecord::Base
   attr_accessible :price, :weekly, :newspaper_id

   has_many :user_subscriptions
   has_many :users, :through => :user_subscriptions


   belongs_to :newspaper


   validates :price,  :newspaper, :presence => true
   validates :weekly, :inclusion => { :in => [true, false]}
end
