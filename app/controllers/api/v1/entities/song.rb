module Api::V1::Entities
  class Song < Api::V1::Entities::Base
    expose :id
    expose :name
    expose :about
    expose :artist_id
    expose :streams
    expose :likes
    expose :created_at
  end
  # class TrendingSong < Api::V1::Entities::Base
  #   expose :id
  #   expose :name
  #   expose :streams
  #   expose :likes
  #   expose :created_at
  # end
end