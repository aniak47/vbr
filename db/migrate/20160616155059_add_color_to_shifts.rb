class AddColorToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :color, :string
  end
end
