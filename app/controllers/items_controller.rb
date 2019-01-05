class ItemsController < WebApplicationController

  load_and_authorize_resource :category
  load_and_authorize_resource :item, through: %i[category], shallow: true


  def index
    @items = @items.where(is_sell_out: true) if params[:is_sell_out].present?
    @items = @items.page(params[:page]).per(12)
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def destroy
    @item.destroy
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      redirect_to @item
    else
      redirect_to :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
    else
      redirect_to :new
    end
  end

  def show; end

  private

  def item_params
    params.fetch(:item, {}).permit(
        :name,
        :description,
        :show_survey_title,
        :show_survey_description
    )
  end

end
