FactoryGirl.define do
  factory :person do
    first_name  'YC'
    last_name   'diao'
    dob         Date.today - 2.year
  end

end
