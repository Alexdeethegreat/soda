class AddSongtoArtists < ActiveRecord::Migration[5.1]
  def change
  	add_reference :songs, :artist, index: true
  	add_foreign_key :songs, :artists 
  end
end
