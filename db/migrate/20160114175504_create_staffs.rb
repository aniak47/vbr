class CreateStaffs < ActiveRecord::Migration[4.2.2]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
