class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.string :reservation
      t.references :product_id, foreign_key: true
      t.references :cart_id, foreign_key: true

      t.timestamps
    end
  end
end
