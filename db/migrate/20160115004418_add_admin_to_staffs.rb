class AddAdminToStaffs < ActiveRecord::Migration[4.2.2]
  def change
    add_column :staffs, :admin, :boolean, default: false
  end
end
