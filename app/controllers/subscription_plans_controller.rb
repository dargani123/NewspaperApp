class SubscriptionPlansController < ApplicationController

  def new
    @subscription_plan = SubscriptionPlan.new
  end

  def show
    @subscription_plan = SubscriptionPlan.find(params[:id])
  end

  def create
    @subscription_plan = SubscriptionPlan.new(params[:subscription_plan])
    if @subscription_plan.save
      redirect_to @subscription_plan.newspaper
    else
      ## FLASH NOTICES HERE?
      render :new
    end
  end
end

