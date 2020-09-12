class CreateOders < ActiveRecord::Migration[6.0]
  def change
    create_table :oders do |t|

      t.string     :postalcode,         null: false
      t.integer    :delivery_area_id,   null: false
      t.string     :municipalities,     null: false
      t.string     :address,            null: false
      t.string     :building,           
      t.string     :phone,              null: false
      t.references :buy,                null: false, foreign_key: true

      t.timestamps
    end
  end
end
