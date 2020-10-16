class AddStatusToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :status_cd, :integer, index: true
  end
end
