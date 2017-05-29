FactoryGirl.define do
  factory :diagnosis do
    name { Faker::Name.unique.diagnosis_name }
    specialty
    initialize_with { Diagnosis.find_or_create_by(name: name) }
  end
end
