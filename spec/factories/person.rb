FactoryGirl.define do
  factory :person do
    first_name  'YC'
    last_name   'diao'
    gender      'male'
    dob         Date.today - 2.year
  end
end
