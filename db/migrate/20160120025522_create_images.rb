class CreateImages < ActiveRecord::Migration
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
