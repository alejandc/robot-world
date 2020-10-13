class CreateAssemblyLines < ActiveRecord::Migration[6.0]
  def change
    create_table :assembly_lines do |t|
      t.string :name
      t.integer :assembly_order

      t.references :factory

      t.timestamps
    end
  end
end
