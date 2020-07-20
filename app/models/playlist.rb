class Playlist < ActiveRecord::Base
    belongs_to :user
    validates :playlist_name, presence: true
    validates :genre, presence: true
    validates :artist, presence: true
    validates :song, presence: true
end





