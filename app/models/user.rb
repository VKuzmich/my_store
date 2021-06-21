class User < ApplicationRecord
  # attr_accessor :login

  has_one :cart
  has_many :orders
  has_many :comments

end
