class CreateAttributes < ActiveRecord::Migration[7.0]
  def change
    create_table :attributes do |t|
      t.string :attribute_name, null: false, default: ""
      t.timestamps
    end
  end
end
