FactoryBot.define do
  factory :review do
    user_id { 1 }
    story_id { 1 }
    rate { 1 }
    comment { "MyText" }
  end
end
