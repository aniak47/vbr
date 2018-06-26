class AddKindToStaffs < ActiveRecord::Migration
  def change
    add_column :staffs, :joktype, :string
    add_column :staffs, :power, :int
  end
end
