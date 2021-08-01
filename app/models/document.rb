class Document < ApplicationRecord
  belongs_to :clinician


  def self.all_valid
    self.find_by_sql("SELECT * FROM Documents Where expiration > (SELECT CURRENT_DATE);")
  end
end
