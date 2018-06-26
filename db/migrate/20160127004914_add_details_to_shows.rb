class AddDetailsToShows < ActiveRecord::Migration[4.2.2]
  def change
    add_index :articles, [:catergory, :created_at]
    add_reference :blogposts, :blogable, polymorphic: true, index: true
    add_column :shows, :catergory, :string
  end
end
