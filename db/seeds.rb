# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Person.destroy_all
father = Father.create(first_name: 'Yunchang', last_name: 'Diao', dob: Date.today - 25.years, gender: "male")
mother = Mother.create(first_name: 'Suka', last_name: 'Nguyen', dob: Date.today - 22.years, gender: "female")
Son.create(first_name: 'Tin', last_name: 'Diao', father: father, mother: mother, dob: Date.today, gender: "male")
Son.create(first_name: 'Tan', last_name: 'Diao', father: father, mother: mother, dob: Date.today - 2.years, gender: "male")
Daughter.create(first_name: 'Ly', last_name: 'Diao', father: father, mother: mother, dob: Date.today, gender: "female")
Daughter.create(first_name: 'Nghi', last_name: 'Diao', father: father, mother: mother, dob: Date.today - 2.years, gender: "female")
