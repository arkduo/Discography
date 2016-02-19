class Tune < ActiveRecord::Base
  mount_uploader :mp3, Mp3Uploader
end
