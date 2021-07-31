class Clinician < ApplicationRecord
  has_many :documents
  has_many :clinician_locations
  has_many :locations, through: :clinician_locations
end
