class RemovePictureFromStaffs < ActiveRecord::Migration
  def change
    remove_column :staffs, :avatar_url
  end
end
