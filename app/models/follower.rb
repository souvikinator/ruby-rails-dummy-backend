class Follower < ApplicationRecord
  belongs_to :user, class_name: User.name
  belongs_to :artist, class_name: Artist.name
end
