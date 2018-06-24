class TopTen < ActiveRecord::Base
    belongs_to :staff
    
    validates :title, :description, :staff_id, presence: true
    validates :one_song, :one_artist, :two_song, :two_artist, :three_song, :three_artist,
     :four_song, :four_artist, :five_song, :five_artist, :six_song, :six_artist, :seven_song, :seven_artist,
      :eight_song, :eight_artist, :nine_song, :nine_artist, :ten_song, :ten_artist, presence: true
end
