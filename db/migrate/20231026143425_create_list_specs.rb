class CreateListSpecs < ActiveRecord::Migration[7.0]
  def change
    create_table :list_specs do |t|
      t.string :title
      t.integer :doctor_id

      t.timestamps
    end
  end
end
