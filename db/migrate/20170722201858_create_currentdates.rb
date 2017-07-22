class CreateCurrentdates < ActiveRecord::Migration[5.1]
  def change
    create_table :currentdates do |t|
      t.string :date
      t.string :song

      t.timestamps
    end
  end
end
