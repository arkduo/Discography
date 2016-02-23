class AddImageToTunes < ActiveRecord::Migration
  def change
    add_column :tunes, :image, :string
  end
end
