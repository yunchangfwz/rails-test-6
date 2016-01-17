FactoryGirl.define do
  factory :father do
    first_name 'Father'
    last_name  'last_name'
    gender     'male'
    dob        Date.today - 30.years
  end

end
