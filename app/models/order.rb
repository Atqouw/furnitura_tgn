class Order < ApplicationRecord

  enum status: { not_ordered: 0, new: 1, applied: 2, rejected: 3, sales: 4 }, _prefix: true

  has_secure_token :token

  monetize :amount_cents

  belongs_to :customer, optional: true

  has_many :items_orders, dependent: :destroy
  has_many :items, through: :items_orders

end