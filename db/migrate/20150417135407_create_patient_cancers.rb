class CreatePatientCancers < ActiveRecord::Migration
  def change
    create_table :patient_cancers do |t|
      t.integer :patient_id
      t.integer :cancer_id
      t.date :date_of_diagnosis

      t.timestamps null: false
    end
  end
end
