class Specialty < ActiveRecord::Base
  has_many :diagnoses
  has_many :doctors
  validates :name, uniqueness: true
end
