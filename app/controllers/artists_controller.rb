class ArtistsController < ApplicationController
  def create
    user_id = params[:user_id]
    user = User.find(user_id)
    new_artist = Artist.create(user_id: user.id, song_count: 0)
    render json: new_artist
  end

  def destroy
    query_id = params[:id]
    Artist.destroy(query_id)
    render json: {"message":"deleted #{query_id}!"}
  end

  def index
    artists = Artist.all
    render json: artists
  end

  def show
    query_id = params[:id]
    artist = Artist.find(query_id)
    follower_count = Follower.where(artist_id: query_id).count
    song_count = Song.where(artist_id: query_id).count
    render json: { artist:artist, followers: follower_count, song_count: song_count }
  end
end
