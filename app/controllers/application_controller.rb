class ApplicationController < ActionController::Base

  before_action :determine_categories

  def home; end

  private

  def determine_categories
    @categories = Category.all
  end

end
