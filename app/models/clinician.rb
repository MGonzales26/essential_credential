class Clinician < ApplicationRecord
  has_many :documents
  has_many :clinician_locations
  has_many :locations, through: :clinician_locations

  def location_names
    Clinician.find_by_sql("SELECT name FROM locations;").pluck(:name)
  end

  def valid_documents
    Clinician.find_by_sql("SELECT * FROM documents WHERE expiration > (SELECT CURRENT_DATE);")
  end
end
