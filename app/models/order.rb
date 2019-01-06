class Order < ApplicationRecord

  enum status: { not_ordered: 0, new: 1, applied: 2, rejected: 3, sales: 4 }, _prefix: true

  has_secure_token :token

  monetize :amount_cents

  attr_accessor :customer_phone, :customer_name

  belongs_to :customer, optional: true

  has_many :items_orders, dependent: :destroy
  has_many :items, through: :items_orders

  has_many :attachments, as: :attachable

  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true

  validates :customer_phone, :customer_name, presence: true, if: :status_new?

  after_save :find_or_create_customer

  private

  def find_or_create_customer
    return if customer_phone.blank?
    customer = Customer.find_by(phone: customer_phone)
    customer ||= Customer.create(phone: customer_phone, name: customer_name)
    update_columns(customer_id: customer.id) if customer.present?
  end

end