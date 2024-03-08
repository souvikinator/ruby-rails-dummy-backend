module Api::V1
  class Songs < Grape::API
    include Api::V1::Default
    helpers Api::V1::Helpers::Song

    resource :song do
      desc "get all song"
      get "", root: :song do
        songs = get_all_songs
        present songs
      end

      desc "get top 10 trending songs"
      get "trending" do
        trending_songs = get_trending_songs
        present trending_songs
      end

      desc "get one song"
      params do
        requires :id, type: Integer, desc: "ID of the user"
      end
      get ":id", root: :song do
        Song.find_by!(id: permitted_params[:id])
      end



      # desc "create a song"
      # params do
      #   requires :username, type: Integer, desc:"Username of user"
      # end
      # post "", root: :song do
      #   username = permitted_params[:username]
      #   bio = params[:bio]
      #   User.create!(username: username, bio: bio)
      # end

      # desc "delete song"
      # params do
      #   requires :id, type: Integer, desc: "ID of the user to be deleted"
      # end
      # delete ":id", root: :song do
      #   User.destroy(permitted_params[:id])
      # end
    end
  end
end