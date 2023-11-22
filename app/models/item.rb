class Item < ApplicationRecord

    validates :name, presence: true
    validates :content, presence: true
    validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
    validates :situation_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :charge_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :how_long_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :price, presence: true

    belongs_to :user
    has_one_attached :image
end
