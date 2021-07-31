class ClinicianLocation < ApplicationRecord
  belongs_to :clinician
  belongs_to :location
end
