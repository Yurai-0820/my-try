FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    age {'1'}
    purpose_body_id {2}
    day_training_time_id {2}
  end
end