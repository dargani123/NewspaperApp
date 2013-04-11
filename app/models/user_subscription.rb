class UserSubscription < ActiveRecord::Base
  belongs_to :subscription_plan
  belongs_to :user

  validates :user, :subscription_plan, :presence => true
end
