require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'should validate name' do
    item = Item.new(name:"")
    item.valid?
    expect(item.errors[:name]).to_not be_empty
    
  end
end
