FactoryBot.define do
  factory :like do
    user { nil }
    association :user, factory: :lily
    association :post
  end
end
