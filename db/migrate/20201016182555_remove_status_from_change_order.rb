class RemoveStatusFromChangeOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :change_orders, :status_cd, :integer
  end
end
