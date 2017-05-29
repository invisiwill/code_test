class Appointment < ActiveRecord::Base
  MIN_SCHEDULED_DAYS_FROM_NOW = 3.days
  belongs_to :diagnosis
  belongs_to :doctor
  belongs_to :patient
  validates :patient, :diagnosis, presence: true
  validate :at_least_three_days_in_future
  validate :select_a_doctor, on: :create
  validates_associated :patient

  accepts_nested_attributes_for :patient
  attr_accessor :appointment_time

  def at_least_three_days_in_future
    Time.zone = 'Central Time (US & Canada)'
    self.scheduled_at = Time.strptime(appointment_time, '%m/%d/%Y %H:%M %p') if appointment_time.present?
    if scheduled_at.nil? || scheduled_at < (Time.now + MIN_SCHEDULED_DAYS_FROM_NOW)
      errors.add :scheduled_at, "must be at least 3 days from now"
    end
  end

  def select_a_doctor
    if diagnosis.present? && doctor.nil?
      # Just select the first doctor we can find for now
      self.doctor = diagnosis.specialty.doctors.first
      errors.add(:doctor, "cannot be found for that health issue.") if doctor.nil?
    end
  end

  def properly_formatted_time
    scheduled_at ||= Time.now+MIN_SCHEDULED_DAYS_FROM_NOW
    scheduled_at.strftime('%m/%d/%Y %I:%M %p')
  end
end

