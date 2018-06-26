class AddVideoToArticles < ActiveRecord::Migration[4.2.2]
  def change
    add_column :articles, :video, :string
  end
end
