FactoryGirl.define do
  factory :son do
    first_name 'Son'
    last_name  'last_name'
    gender     'male'
    dob        Date.today - 5.years
  end
end
