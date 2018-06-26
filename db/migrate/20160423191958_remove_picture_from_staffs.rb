class RemovePictureFromStaffs < ActiveRecord::Migration[4.2.2]
  def change
    remove_column :staffs, :avatar_url
  end
end
