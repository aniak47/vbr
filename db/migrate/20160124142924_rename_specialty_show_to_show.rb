class RenameSpecialtyShowToShow < ActiveRecord::Migration[4.2.2]
  def change
    rename_table :specialty_shows, :shows
  end
end
