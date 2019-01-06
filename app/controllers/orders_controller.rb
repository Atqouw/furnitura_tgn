class OrdersController < WebApplicationController

  load_and_authorize_resource :order

  def add_item_to_order
    item = Item.find_by(id: add_item_to_order_params[:item_id])
    return if item.blank?
    @order = Order.find_by(token: add_item_to_order_params[:token])
    @order ||= Order.create

    session[:current_order_id] = @order.id

    @order.items_orders.create(item: item) if @order.present?

    redirect_to order_path(@order) if params[:with_redirect].present? and params[:with_redirect].eql?('true')
  end

  def update
    @order.update_attributes(order_params)
  end

  def destroy
    if @order.destroy
      session[:current_order_id] = nil
    end
  end

  private

  def order_params
    params.fetch(:order, {}).permit(
      :customer_phone,
      :customer_name,
      :status,
      attachments_attributes: [
          :id,
          :title,
          :attach
      ]
    )
  end

  def add_item_to_order_params
    params.fetch(:add_item_to_order_params, {}).permit(
       :item_id, :token
    )
  end

end
