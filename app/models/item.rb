class Item < ApplicationRecord

    validates :image, presence: true
    validates :name, presence: true
    validates :content, presence: true
    validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
    validates :situation_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :charge_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :how_long_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :price, presence: true,numericality: {only_integer: true, message: 'は半角数字で記入してください' }
    validates :price, numericality: {
        greater_than_or_equal_to: 300,
        less_than_or_equal_to: 9_999_999,
        message: 'は300から9,999,999の範囲で入力してください'
    }

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :situation
    belongs_to :charge
    belongs_to :region
    belongs_to :howlong

    belongs_to :user
    has_one_attached :image
    
end
