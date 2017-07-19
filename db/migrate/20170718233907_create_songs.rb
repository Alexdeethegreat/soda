class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.belongs_to :artist, foreign_key: true, index: true
      t.belongs_to :user, index: true 
      t.string :name
      t.string :genre
      t.integer :votes

      t.timestamps
    end
  end
end
