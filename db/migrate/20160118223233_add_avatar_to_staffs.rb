class AddAvatarToStaffs < ActiveRecord::Migration
  def change
    add_column :staffs, :avatar_url, :string
  end
end
