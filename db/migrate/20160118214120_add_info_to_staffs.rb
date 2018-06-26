class AddInfoToStaffs < ActiveRecord::Migration[4.2.2]
  def change
    add_column :staffs, :active, :boolean
    add_column :staffs, :hometown, :string
    add_column :staffs, :fav_music, :text
    add_column :staffs, :duties, :text
    add_column :staffs, :intrests, :text
  end
end
