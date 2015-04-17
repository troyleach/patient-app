class CreateCancers < ActiveRecord::Migration
  def change
    create_table :cancers do |t|
      t.string :type_of_cancer_id
      t.string :cancer_name

      t.timestamps null: false
    end
  end
end
