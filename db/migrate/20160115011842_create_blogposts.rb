class CreateBlogposts < ActiveRecord::Migration[4.2.2]
  def change
    create_table :blogposts do |t|
      t.text :content
      t.references :staff, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :blogposts, [:staff_id, :created_at]
  end
end
