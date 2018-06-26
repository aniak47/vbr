class CreateTopTens < ActiveRecord::Migration
  def change
    create_table :top_tens do |t|
      t.string :title
      t.text :description
      t.references :staff, index: true, foreign_key: true
      t.string :one_song
      t.string :one_artist
      t.string :two_song
      t.string :two_artist
      t.string :three_song
      t.string :three_artist
      t.string :four_song
      t.string :four_artist
      t.string :five_song
      t.string :five_artist
      t.string :six_song
      t.string :six_artist
      t.string :seven_song
      t.string :seven_artist
      t.string :eight_song
      t.string :eight_artist
      t.string :nine_song
      t.string :nine_artist
      t.string :ten_song
      t.string :ten_artist
      
      t.timestamps null: false
    end
    add_index :top_tens, [:created_at]
    add_index :images, [:catergory]
  end
end
