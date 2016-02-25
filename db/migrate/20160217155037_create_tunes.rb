class CreateTunes < ActiveRecord::Migration
  def change
    create_table :tunes do |t|
      t.string :title
      t.string :tracknum
      t.string :genre
      t.string :remarks
      t.integer :artist_id
      t.integer :album_id

      t.timestamps null: false
    end
  end
end
