class Album < ActiveRecord::Base
  has_many :tunes
end
