class AddSpotifyIdToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :spotify_id, :string
    remove_column :songs, :genre, :string
    remove_column :artists, :genre, :string
  end
end
