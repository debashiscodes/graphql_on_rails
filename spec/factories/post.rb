FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.word  }
    description { Faker::Lorem.word  }
  end
end
