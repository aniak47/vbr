class AddPictureToBlogposts < ActiveRecord::Migration[4.2.2]
  def change
    add_column :blogposts, :picture, :string
  end
end
