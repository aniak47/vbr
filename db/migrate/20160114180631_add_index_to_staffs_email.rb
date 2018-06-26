class AddIndexToStaffsEmail < ActiveRecord::Migration[4.2.2]
  def change
    add_index :staffs, :email, unique: true
  end
end
