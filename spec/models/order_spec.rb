require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'should calculates price of the order' do
    item1 = Item.new(price: 10)
    item2 = Item.new(price: 20)
    item3 = Item.new(price: 30)

    order = Order.new
    order.items << item1
    order.items << item2
    order.items << item3
    order.calculate_total
    expect(order.total).to eq(60)
  end
end
