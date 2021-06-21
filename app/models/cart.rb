class Cart < ApplicationRecord
  belongs_to              :user, class_name: "User", optional: true
  has_and_belongs_to_many :items
end
