class CreateChangeOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :change_orders do |t|
      t.integer :status_cd

      t.references :model
      t.references :order

      t.timestamps
    end
  end
end
