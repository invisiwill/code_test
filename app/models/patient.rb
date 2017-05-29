class Patient < ActiveRecord::Base
  include PersonConcern
  belongs_to :diagnosis
  has_many :appointments
end
