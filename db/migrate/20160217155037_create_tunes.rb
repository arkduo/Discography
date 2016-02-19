class CreateTunes < ActiveRecord::Migration
  def change
    create_table :tunes do |t|
      t.string :name
      t.string :artist
      t.string :genre

      t.timestamps null: false
    end
  end
end
