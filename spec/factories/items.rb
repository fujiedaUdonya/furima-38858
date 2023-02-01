FactoryBot.define do
  factory :item do
      item_title {Faker::Lorem.sentence}
      introduction {Faker::Lorem.sentence}
      price {Faker::Number.within(range: 300..9999999)}
      condition_id {3}
      category_id {3}
      prefecture_id {3}
      shipping_charge_id {3}
      day_to_ship_id {3}
      image {Rack::Test::UploadedFile.new(Rails.root.join("app/assets/images/guest_image.jpg")) }

      association :user
  end
end
