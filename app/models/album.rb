class Album < ActiveRecord::Base
  has_many :tunes
  mount_uploader :image, ImageUploader
end
