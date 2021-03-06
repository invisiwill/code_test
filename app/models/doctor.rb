class Doctor < ActiveRecord::Base
  include PersonConcern
  belongs_to :specialty
  has_many :appointments
  validates :specialty, presence: true

  def name
    "Dr. #{super}"
  end
end
