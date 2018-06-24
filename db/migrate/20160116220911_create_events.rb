class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.text :blurb
      t.string :location
      t.string :catergory

      t.timestamps null: false
    end
    add_index :events, [:date, :catergory]
  end
end
