class ItemsOrder < ApplicationRecord

  belongs_to :item
  belongs_to :order

  after_create :recalculate_order_amount
  after_destroy :recalculate_order_amount
  
  private

  def recalculate_order_amount
    self.order.update(amount: self.order.items.sum(&:price_with_discount))
  end

end