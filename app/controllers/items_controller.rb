class ItemsController < WebApplicationController

  load_and_authorize_resource :category
  load_and_authorize_resource :item, through: %i[category], shallow: true


  def index
    @items = @items.where(is_sell_out: true) if params[:is_sell_out].present?
    @items = @items.page(params[:page]).per(12)
  end

  def show; end

  private

  def item_params
    params.fetch(:item, {}).permit(
        :title,
        :description,
        :show_survey_title,
        :show_survey_description
    )
  end

end
