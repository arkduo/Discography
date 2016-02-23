class AddMp3ToTunes < ActiveRecord::Migration
  def change
    add_column :tunes, :mp3, :string
  end
end
