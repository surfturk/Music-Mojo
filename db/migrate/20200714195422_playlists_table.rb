class PlaylistsTable < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
       t.string :playlist_name
       t.string :genre
       t.string :artist
       t.string :song
    end
  end
end
