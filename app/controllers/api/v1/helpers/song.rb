module Api::V1::Helpers::User
  extend Grape::API::Helpers

  def get_all_songs
    songs = Song.all
    present songs
  end

  def get_trending_songs
    value = Rails.cache.fetch("trending_songs")
    if value
      trending_songs = Marshal.load(value)
    else
      # run query to get top 10 songs with listings in desc
      # store
      # return
    end

    present trending_songs
  end
end