class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name, null: false, default: ""
      t.text :description, null: false, default: ""
      t.integer :status, null: false, default: 0 # { 0: Inactive, 1 : Active }
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
