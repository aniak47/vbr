class AddPictureToBlogposts < ActiveRecord::Migration
  def change
    add_column :blogposts, :picture, :string
  end
end
