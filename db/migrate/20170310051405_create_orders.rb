class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :reservation
      t.integer :product_id

      t.timestamps
    end
  end
end
