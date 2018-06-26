class AddKindToStaffs < ActiveRecord::Migration[4.2.2]
  def change
    add_column :staffs, :joktype, :string
    add_column :staffs, :power, :int
  end
end
