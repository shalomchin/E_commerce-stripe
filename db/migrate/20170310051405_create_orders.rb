class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :product, foreign_key: true
      t.integer :product_id

      t.timestamps
    end
  end
end
