FactoryBot.define do
  factory :post do
    name { "MyString" }
    description { "MyText" }
    association :user,factory: :lily
  end
end
