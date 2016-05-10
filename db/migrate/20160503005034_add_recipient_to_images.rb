class AddRecipientToImages < ActiveRecord::Migration
  def change
    add_column :images, :recipient, :string
  end
end
