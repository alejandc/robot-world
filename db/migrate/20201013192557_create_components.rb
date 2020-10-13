class CreateComponents < ActiveRecord::Migration[6.0]
  def change
    create_table :components do |t|
      t.integer :type_cd
      t.boolean :error

      t.references :car

      t.timestamps
    end
  end
end
