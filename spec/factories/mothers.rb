FactoryGirl.define do
  factory :mother do
    first_name 'Mother'
    last_name  'last_name'
    gender     'female'
    dob        Date.today - 20.years
  end

end
