class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :address
      t.integer :contact
      t.string :email
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
