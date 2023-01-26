FactoryBot.define do
  factory :user do  
    nickname {"test"}
    email {Faker::Internet.free_email}
    password {"test1234"}
    last_name {"苗字"}
    first_name {"名前"}
    last_name_kana {"ミョウジ"}
    first_name_kana {"ナマエ"}
    birth_date {"1988-11-10"}
  end  
end
