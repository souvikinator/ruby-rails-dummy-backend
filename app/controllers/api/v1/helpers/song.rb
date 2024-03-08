module Api::V1::Helpers::Song
  extend Grape::API::Helpers

  def get_all_songs
    songs = Song.all
    present songs, with: Api::V1::Entities::Song
  end

  def get_trending_songs
    value = Rails.cache.fetch("trending_songs")
    if value
      trending_songs = Marshal.load(value)
    else
      trending_songs = Song.all.order(streams: :desc).limit(10)
      Rails.cache.write("trending_songs",Marshal.dump(trending_songs))
    end

    present trending_songs, with: Api::V1::Entities::Song
  end
end