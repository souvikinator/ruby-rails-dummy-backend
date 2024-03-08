module Api::V1
    class Users < Grape::API
      include Api::V1::Default
      helpers Api::V1::Helpers::User

      resource :user do
        desc "get all users"
        get "", root: :user do
          users = get_all_users
          present users
        end

        desc "get one user"
        params do
          requires :id, type: Integer, desc: "ID of the user"
        end
        get ":id", root: :user do
          id = permitted_params[:id]
          user = get_user(id)
          present user
        end

        desc "create a user"
        params do
          requires :username, type: Integer, desc:"Username of user"
          optional :bio, type: String, desc: "Profile bio of the user"
        end
        post "", root: :user do
          username = permitted_params[:username]
          bio = permitted_params[:bio]
          User.create!(username: username, bio: bio)
        end

        desc "delete user"
        params do
          requires :id, type: Integer, desc: "ID of the user to be deleted"
        end
        delete ":id", root: "user" do
          User.destroy(permitted_params[:id])
        end
      end
    end
end