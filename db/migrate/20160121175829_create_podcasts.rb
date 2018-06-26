class CreatePodcasts < ActiveRecord::Migration[4.2.2]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.text :description
      t.references :staff, index: true, foreign_key: true
      t.string :audio
      t.string :catergory

      t.timestamps null: false
    end
    add_index :podcasts, [:staff_id, :created_at]
    add_index :podcasts, [:catergory, :created_at]
    add_index :podcasts, :created_at
  end
end
