class AddColorToShifts < ActiveRecord::Migration[4.2.2]
  def change
    add_column :shifts, :color, :string
  end
end
