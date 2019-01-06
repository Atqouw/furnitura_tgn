class ItemsOrdersController < WebApplicationController

  load_and_authorize_resource :items_order

  def destroy
    @items_order.destroy
    redirect_to root_url if @items_order.order.items.blank?
  end

end
