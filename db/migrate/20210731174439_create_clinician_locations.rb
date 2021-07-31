class CreateClinicianLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :clinician_locations do |t|
      t.references :clinician, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
