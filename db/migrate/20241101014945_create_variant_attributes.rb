class CreateVariantAttributes < ActiveRecord::Migration[7.0]
  def change
    create_table :variant_attributes do |t|
      t.string :value, null: false, default: ""
      t.references :variant, foreign_key: true
      t.references :attribute, foreign_key: true
      t.timestamps
    end
  end
end
