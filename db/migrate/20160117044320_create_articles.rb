class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.text :subtitle
      t.references :staff, index: true, foreign_key: true
      t.string :type

      t.timestamps null: false
    end
  end
end
