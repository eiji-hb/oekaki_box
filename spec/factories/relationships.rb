FactoryBot.define do
  factory :relationship do
    association :followed, factory: :bob
    association :follower, factory: :lily

  end
end
