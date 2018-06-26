class AddRefToImages < ActiveRecord::Migration[4.2.2]
  def change
     add_reference :images, :imageable, polymorphic: true, index: true
  end
end
