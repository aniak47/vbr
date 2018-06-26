class AddTitleToBlogposts < ActiveRecord::Migration[4.2.2]
  def change
    add_column :blogposts, :title, :string
    add_column :blogposts, :subtitle, :string
    
    change_column :staffs, :active, :boolean, :default => true
    change_column :staffs, :admin, :boolean, :default => false
  end
end
