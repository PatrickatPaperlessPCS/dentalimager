class AddInfoToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :parent_id, :integer
    add_column :patients, :user_id, :integer
    add_column :patients, :identifier, :string
  end
end
