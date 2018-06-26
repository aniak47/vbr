class AddAvatarToStaffs < ActiveRecord::Migration[4.2.2]
  def change
    add_column :staffs, :avatar_url, :string
  end
end
