class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :image_url
      t.string :email
      t.string :location
      t.string :password
      t.string :name
      t.string :genre

      t.timestamps
    end
  end
end
