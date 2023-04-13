FactoryBot.define do
  factory :story do
    title { FFaker::Lorem.sentence(2) }

    body { FFaker::Lorem.sentence(4) }
    association(:user)

    trait :with_review do
      users_ids = User.all.ids
      after(:create) do |story|
        create_list(:review, 4, story:, user_id: users_ids.sample)
      end
    end

  end
end
