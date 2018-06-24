class RemoveTypeFromImage < ActiveRecord::Migration
  def change
    remove_column :images, :type, :string
    remove_column :articles, :type, :string
    add_column :articles, :catergory, :string
    add_column :images, :catergory, :string
  end
end
