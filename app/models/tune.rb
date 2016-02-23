class Tune < ActiveRecord::Base
  mount_uploader :mp3, Mp3Uploader
  mount_uploader :image, ImageUploader

  def save_info
    Mp3Info.open(mp3.path) do |file|
      file.tag.each do |key, val|
        case key
        when 'title' then
          self.name = val
        when 'artist' then
          self.artist = val
        when 'album' then
          self.album = val
        when 'genre_s' then
          self.genre = val
        end
      end
    end
    save
  end
end
