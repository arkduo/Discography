class Tune < ActiveRecord::Base
  belongs_to :artist
  belongs_to :album
  accepts_nested_attributes_for :artist
  accepts_nested_attributes_for :album
  mount_uploader :mp3, Mp3Uploader

  def save_info
    title, name, year = '', '', 0
    Mp3Info.open(mp3.path) do |file|
      file.tag.each do |key, val|
        case key
        when 'title' then
          self.title = val
        when 'album' then
          title = val
        when 'artist' then
          name = val
        when 'year' then
          year = val
        when 'tracknum' then
          self.tracknum = val
        when 'genre_s' then
          self.genre = val
        end
      end
      save_album(title, year)
      save_artist(name)
    end
    save
  end

  def save_artist(name)
    res = Artist.find_by(name: name)
    if res == nil
      new = Artist.create(name: name)
      res = new
    end
    self.artist_id = res.id
  end

  def save_album(title, year)
    res = Album.find_by(title: title, year: year)
    if res == nil
      new = Album.create(title: title, year: year)
      res = new
    end
    self.album_id = res.id
  end

  def update_info(params)
    save_artist(params[:artist_attributes][:name])
    save_album(params[:album_attributes][:title], params[:album_attributes][:year])
  end
end
