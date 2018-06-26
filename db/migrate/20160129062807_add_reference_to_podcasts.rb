class AddReferenceToPodcasts < ActiveRecord::Migration[4.2.2]
  def change
    add_reference :podcasts, :show, index: true, foreign_key: true
  end
end
