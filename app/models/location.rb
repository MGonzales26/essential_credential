class Location < ApplicationRecord
  has_many :clinician_locations
  has_many :clinicians, through: :clinician_locations
end
