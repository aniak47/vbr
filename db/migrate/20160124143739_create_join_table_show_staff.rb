class CreateJoinTableShowStaff < ActiveRecord::Migration
  def change
    create_table :shows_staffs, id: false do |t|
      t.belongs_to :show, index: true
      t.belongs_to :staff, index: true
    end
  end
end
