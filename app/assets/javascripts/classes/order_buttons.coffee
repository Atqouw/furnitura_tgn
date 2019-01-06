class Application.Classes.OrderButtons

  constructor: (@$scope) ->
    @item_id = @$scope.data('itemId')
    @$add_to_order = @$scope.find('[data-add-to-order]')
    @$add_to_order_and_buy = @$scope.find('[data-add-to-order-and-buy]')


    @$add_to_order.on 'click', (event) => @addToOrder()
    @$add_to_order_and_buy.on 'click', (event) => @addToOrder(true)


  addToOrder: (with_redirect) =>
    token = localStorage.getItem('currentOrderToken')
    result = { add_item_to_order_params: { item_id: @item_id, token: token }, with_redirect: with_redirect }
    $.ajax
      type: 'POST'
      url: '/orders/add_item_to_order'
      dataType: 'SCRIPT'
      data: result