class PurchasesAddress

  include ActiveModel::Model
    attr_accessor :prefecture_id, :post_code, :city, :house_number, :other, :phone_number, :user_id, :item_id, :token

    with_options presence: true do
      validates :post_code,       format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
      validates :prefecture_id,   numericality: { other_than: 0 , message: "can't be blank"} 
      validates :city              
      validates :house_number      
      validates :phone_number,    format: {with: /\A[0-9]{10,11}\z/}
      validates :user_id
      validates :item_id
      validates :token
   end

    def save
      purchase = Purchase.create(item_id: item_id, user_id: user_id)
      Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, other: other, phone_number: phone_number, purchase_id: purchase.id)
    end
    
end
