class Item < ApplicationRecord


  validates :item_title,          presence: true
  validates :introduction,        presence: true
  validates :price,               presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }                        
  validates :condition_id,        presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :category_id,         presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,       presence: true, numericality: { other_than: 0 , message: "can't be blank"} 
  validates :shipping_charge_id,  presence: true, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :day_to_ship_id,      presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :image,               presence: true

  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :category
  belongs_to :shipping_charge
  belongs_to :day_to_ship

end
