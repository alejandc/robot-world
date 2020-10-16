class AddNewOrderReferenceToChangeOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :change_orders, :new_order_id, :integer
  end
end
