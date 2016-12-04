FactoryGirl.define do
  factory :patient do
    name  Faker::Name.name
    birth Faker::Date.between(60.years.ago, 6.months.ago)
    sex   true
    usd   nil
  end
end
