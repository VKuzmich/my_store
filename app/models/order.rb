class Order < ApplicationRecord
  attr_accessor :user, :user_id

  belongs_to :user, class_name: "User", optional: true
  
end
