class Diagnosis < ActiveRecord::Base
  belongs_to :specialty
  has_many :appointments
  validates :name, :specialty, presence: true
  validates :name, uniqueness: true
end
