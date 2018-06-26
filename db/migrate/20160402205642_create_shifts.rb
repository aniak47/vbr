class CreateShifts < ActiveRecord::Migration[4.2.2]
  def change
    create_table :shifts do |t|
      t.string :title
      t.text :blurb
      t.time :start
      t.time :end
      t.boolean :active
      t.string :day

      t.timestamps null: false
    end
    
    create_table :shifts_staffs, id: false do |t|
      t.belongs_to :staff, index: true
      t.belongs_to :shift, index: true
    end
  end
end
