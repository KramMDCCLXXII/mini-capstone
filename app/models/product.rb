class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than: 1}
  validates :description, length: { maximum: 500 }

  belongs_to :supplier
  has_many :images
  has_many :orders
  
end
