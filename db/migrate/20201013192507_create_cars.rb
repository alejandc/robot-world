class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.integer :status_cd

      t.references :assembly_line
      t.references :model

      t.timestamps
    end
  end
end
