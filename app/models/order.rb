class Order < ApplicationRecord
  belongs_to :store
  has_many :items

  enum status: { "completed": "completed", "pending": "pending", "canceled": "canceled"}
end
