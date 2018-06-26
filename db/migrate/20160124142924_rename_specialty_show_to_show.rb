class RenameSpecialtyShowToShow < ActiveRecord::Migration
  def change
    rename_table :specialty_shows, :shows
  end
end
