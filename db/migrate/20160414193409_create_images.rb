class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :patient_name
      t.string :patient_id
      t.string :image_desc
      t.string :dob

      t.timestamps null: false
    end
  end
end
