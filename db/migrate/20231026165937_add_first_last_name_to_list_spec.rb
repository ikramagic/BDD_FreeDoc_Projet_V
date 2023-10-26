class AddFirstLastNameToListSpec < ActiveRecord::Migration[7.0]
  def change
    add_column :list_specs, :first_name, :string
    add_column :list_specs, :last_name, :string
    add_column :list_specs, :new_spec, :string
  end
end
