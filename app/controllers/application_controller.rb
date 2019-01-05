class ApplicationController < ActionController::Base

  before_action :determine_categories

  def home
    @items = Item.all.page(params[:page]).per(12)
  end

  private

  def determine_categories
    @categories = Category.all
  end

end
