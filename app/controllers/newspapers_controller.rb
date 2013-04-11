class NewspapersController < ApplicationController

  def new
    @newspaper = Newspaper.new
    @newspaper.subscription_plans.build
  end

  def show
    @newspaper = Newspaper.find(params[:id])

  end

  def create
    @newspaper = Newspaper.new(params[:newspaper])
    if @newspaper.save
      redirect_to newspaper_url(@newspaper)
    else
      render :new
    end

  end

end
