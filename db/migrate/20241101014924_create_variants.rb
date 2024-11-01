class CreateVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :variants do |t|
      t.string :sku, null: false, default: ""
      t.integer :price, null: false, default: 0
      t.integer :availability_status, null: false, default: 0 # { 0: out_of_stock, 1: in_stock }
      t.integer :stock, null: false, default: 0
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
