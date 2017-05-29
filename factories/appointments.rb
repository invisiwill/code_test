FactoryGirl.define do
  factory :appointment do
    appointment_time { (Time.now + rand(3..15).days).strftime('%m/%d/%Y %I:%M %p') }
    doctor
    patient
    diagnosis
  end
end
