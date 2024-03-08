module Api::V1
  class Songs < Grape::API
    include Api::V1::Default

    resource :song do
      desc "get all users"
      get "", root: :song do
        User.all
      end

      desc "get one user"
      params do
        requires :id, type: Integer, desc: "ID of the user"
      end
      get ":id", root: :song do
        User.where(id: permitted_params[:id]).first!
      end

      desc "create a user"
      params do
        requires :username, type: Integer, desc:"Username of user"
      end
      post "", root: :song do
        username = permitted_params[:username]
        bio = params[:bio]
        User.create!(username: username, bio: bio)
      end

      desc "delete user"
      params do
        requires :id, type: Integer, desc: "ID of the user to be deleted"
      end
      delete ":id", root: :song do
        User.destroy(permitted_params[:id])
      end
    end
  end
end