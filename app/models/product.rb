class Product < ApplicationRecord
    has_many :comments, dependent: :destroy 
    validates :name, presence: true
    validates :price, presence: true, numericality: true
    validates :size, presence: true, numericality: {only_integer: true}
    validates :color, presence: true
    validates :brand, presence: true
    validates :seller, presence: true
    validates :description, presence: true
end
