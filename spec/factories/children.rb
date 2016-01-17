FactoryGirl.define do
  factory :child do
    first_name 'child'
    last_name  'last_name'
    gender     'female'
    dob        Date.today - 1.years
    father     
  end
end
