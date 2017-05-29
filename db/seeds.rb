# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

3.times do
  FactoryGirl.create :specialty
end
Faker::Name.unique.clear

3.times do
  FactoryGirl.create :diagnosis
end
Faker::Name.unique.clear

10.times do
  FactoryGirl.create :doctor
end

10.times do
  FactoryGirl.create :patient
end

