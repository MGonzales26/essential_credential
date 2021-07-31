class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :type
      t.date :expiration
      t.references :clinician, null: false, foreign_key: true

      t.timestamps
    end
  end
end
