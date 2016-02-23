class AddAlbumToTunes < ActiveRecord::Migration
  def change
    add_column :tunes, :album, :string
  end
end
