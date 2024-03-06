class ArtistsController < ApplicationController
  def create
    user_id = params[:user_id]
    user = User.find(user_id)
    new_artist = Artist.create(user_id: user.id, song_count: 0)
    render json: new_artist
  end

  def destroy
    query_id = params[:id]
    artist = Artist.find_by(id:query_id)
    if artist
      artist.destroy
      render json: {"message":"deleted #{query_id}!"}
    else
      render json: {"message":"Artist not found"}
    end
  end

  def index
    artists = Artist.all
    render json: artists
  end

  def show
    query_id = params[:id]
    artist = Artist.find_by(id:query_id)
    unless artist
      render json: {"message":"artist not found"}
    else
      follower_count = Follower.where(artist_id: query_id).count
      song_count = Song.where(artist_id: query_id).count

      render json: { artist:artist, followers: follower_count, song_count: song_count }
    end

  end
end
