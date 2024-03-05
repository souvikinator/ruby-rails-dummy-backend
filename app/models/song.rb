class Song < ApplicationRecord
  belongs_to :artist, class_name: Artist.name
end
