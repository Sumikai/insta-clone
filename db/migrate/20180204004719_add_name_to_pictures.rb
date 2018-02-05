class AddNameToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :name, :string
  end
end
