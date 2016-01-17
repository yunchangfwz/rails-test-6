FactoryGirl.define do
  factory :daughter do
    first_name 'Daughter'
    last_name  'last_name'
    gender     'female'
    dob        Date.today - 5.years
  end
end
