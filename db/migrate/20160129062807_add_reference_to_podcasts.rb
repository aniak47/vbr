class AddReferenceToPodcasts < ActiveRecord::Migration
  def change
    add_reference :podcasts, :show, index: true, foreign_key: true
  end
end
