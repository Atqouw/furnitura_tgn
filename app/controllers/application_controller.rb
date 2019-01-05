class ApplicationController < ActionController::Base

  before_action :determine_categories

  def home
    @items_for_slider = Item.where(is_show_on_main_slider: true).limit(10)
    @items = Item.all.page(params[:page]).per(12)
  end

  private

  def determine_categories
    @categories = Category.all
    @items_size = Item.count
  end

end
