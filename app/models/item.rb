class Item < ApplicationRecord


  validates :item_title,          presence: true
  validates :introduction,        presence: true
  validates :prise,               presence: true                       
  validates :condition_id,        presence: true,       
  validates :category_id,         presence: true,       
  validates :prefecture_id,       presence: true,  
  validates :shipping_charge_id,  presence: true,  
  validates :day_to_ship_id,      presence: true

  has_many :users


  # format:{ with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }             
  # format:{ with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  # format:{ with: /\A[ァ-ヶー－]+\z/ }
  



end
