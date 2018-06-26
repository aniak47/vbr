class CreateItems < ActiveRecord::Migration[4.2.2]
  def change
    create_table :items do |t|
      t.string :name, index: true
      t.text :description
      t.float :price
      t.text :button
      t.string :picture

      t.timestamps null: false
    end
  end
end
