class AddingCity < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :city, :string
    add_column :patients, :city, :string
    add_column :appointments, :city, :string
  end
end
