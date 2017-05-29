FactoryGirl.define do
  factory :specialty do
    name { Faker::Name.unique.specialty_name }
    initialize_with { Specialty.find_or_create_by(name: name) }
  end
end
