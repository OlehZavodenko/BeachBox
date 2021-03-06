class Order < ApplicationRecord
  belongs_to :user
  belongs_to :order_status, foreign_key: :status
  has_many :order_items
  before_save :update_subtotal

  def subtotal
   order_items.collect { |oi| oi.valid? ? (oi.orderitems_quantity * oi.unit_price) : 0 }.sum
  end

  def update_subtotal
    p "subtotal == ", self[:subtotal] = subtotal
  end

  def cart_total
    self[:total_price] = self[:orderitems_quantity] * self[:unit_price]
   order_items.to_a.sum { |item| item.total_price }
 end

private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
