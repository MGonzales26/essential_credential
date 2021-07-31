class CreateClinicians < ActiveRecord::Migration[6.0]
  def change
    create_table :clinicians do |t|
      t.string :name
      t.string :specialty

      t.timestamps
    end
  end
end
