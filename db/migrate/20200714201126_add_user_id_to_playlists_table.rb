class AddUserIdToPlaylistsTable < ActiveRecord::Migration
  def change
      add_column :playlists, :user_id, :integer
  end
end
