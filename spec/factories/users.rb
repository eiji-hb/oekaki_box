FactoryBot.define do
  factory :lily, class: User do
    username { "lily" }
    email { "lily@email.com" }
    password { "password" }
    password_confirmation { "password" }
  end
  factory :bob, class: User do
    username { "bob" }
    email { "bob@email.com" }
    password { "password" }
    password_confirmation { "password" }
  end
  factory :tom, class: User do
    username { "tom" }
    email { "tom@email.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :test, class: User do
    username { "test" }
    email { "test@example.com" }
    password { "testtest" }
    password_confirmation { "testtest" }
  end
end
