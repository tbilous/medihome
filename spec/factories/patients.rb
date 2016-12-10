FactoryGirl.define do
  factory :patient do
    name  Faker::Name.name
    birth Faker::Date.between(60.years.ago, 6.months.ago)
    sex   true
    usd   nil
  end
  factory :wrong_patient, class: 'Patient' do
    name  nil
    birth nil
    sex   nil
    usd   nil
  end
end
