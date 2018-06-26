class AddEndtimeToEvents < ActiveRecord::Migration[4.2.2]
  def change
    add_column :events, :endtime, :time
  end
end
