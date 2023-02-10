FactoryBot.define do
  factory :address do
    post_code {'028-1111'}
    prefecture_id {3}
    city {'上閉伊郡'}
    house_number {'1-1'}
    other {'新町フジヤ'}
    phone_number {'00030984300'}

    association :purchase_record
  end
end
