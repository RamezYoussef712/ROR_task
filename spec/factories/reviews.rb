FactoryBot.define do
  factory :review do
    user
    story
    rate { FFaker::Number.rand(1..5) }
    comment { FFaker::Lorem.sentence(4) }
  end
end
