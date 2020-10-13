class CreateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :models do |t|
      t.string :name
      t.integer :year
      t.decimal :price, precision: 10, scale: 2
      t.decimal :cost_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
