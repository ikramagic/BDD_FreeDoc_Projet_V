class CreateListSpecs < ActiveRecord::Migration[7.0]
  def change
    create_table :list_specs do |t|
      t.belongs_to :doctor, index: true
      t.belongs_to :specialty, index: true

      t.timestamps
    end
  end
end
