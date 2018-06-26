class CreateSpecialtyShows < ActiveRecord::Migration[4.2.2]
  def change
    create_table :specialty_shows do |t|
      t.string :name
      t.text :description
      t.text :day
      t.time :start
      t.time :end

      t.timestamps null: false
    end
    add_index :specialty_shows, :name
  end
end
