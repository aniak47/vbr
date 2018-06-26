class AddPhotoToStaffs < ActiveRecord::Migration[4.2.2]
  def change
    add_column :staffs, :photo, :string
  end
end
