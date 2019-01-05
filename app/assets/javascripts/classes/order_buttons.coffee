class Application.Classes.OrderButtons

  constructor: (@$scope) ->
    @item_id = @$scope.data('itemId')
    @$add_to_order = @$scope.find('[data-add-to-order]')


    @$add_to_order.on 'click', (event) =>
      token = localStorage.getItem('currentOrderToken')
      result = { add_item_to_order_params: { item_id: @item_id, token: token } }
      $.ajax
        type: 'POST'
        url: '/orders/add_item_to_order'
        dataType: 'SCRIPT'
        data: result