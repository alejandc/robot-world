class AddIndexToCarStatusField < ActiveRecord::Migration[6.0]
  def change
    add_index :cars, :status_cd
  end
end
