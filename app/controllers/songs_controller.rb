class SongsController < ApplicationController
  def create
    artist_id = params[:id]
    song_name = params[:name]
    about = params[:about]
    if Artist.exists?(artist_id)
      new_song = Song.create(name: song_name, about: about, artist_id: artist_id)
      render json: new_song
    else
      render json: { message: "Artist account not created" }, status: :bad_request
    end
  end

  def destroy
    artist_id = params[:id]
    song_id = params[:song_id]

    song = Song.find_by(id: song_id, artist_id: artist_id)

    if song
      song.destroy
      render json: { message: "Song deleted successfully" }
    else
      render json: { message: "Song not found for the artist" }, status: :not_found
    end
  end

  def index
    songs = Song.all
    render json: songs
  end

  def show
    song_id = params[:song_id]
    song = Song.find_by(id:song_id)
    unless song
      render json: { message: "Song not found" }, status: :not_found
    else
      render json: song
    end
  end
end
