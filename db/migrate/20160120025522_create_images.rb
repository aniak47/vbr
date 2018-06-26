class CreateImages < ActiveRecord::Migration[4.2.2]
  def change
    create_table :images do |t|
      t.string :title
      t.text :description
      t.time :expire
      t.string :type
      t.string :picture

      t.timestamps null: false
    end
  end
end
