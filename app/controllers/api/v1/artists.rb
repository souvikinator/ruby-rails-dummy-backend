module Api::V1
  class Artists < Grape::API
    include Api::V1::Default

    resource :artist do
      desc "get all artists"
      get "", root: :artist do
        Artist.all
      end

      desc "get one artist"
      params do
        requires :id, type: Integer, desc: "ID of the artist"
      end
      get ":id", root: :artist do
        Artist.where(id: permitted_params[:id]).first!
      end

      desc "create an artist profile"
      params do
        requires :id, type: Integer, desc:"user id"
      end
      get ":id", root: :artist do
        Artist.create!(user_id: permitted_params[:id])
      end

      desc "delete artist"
      params do
        requires :id, type: Integer, desc: "ID of the artist to be deleted"
      end
      delete ":id", root: :artist do
        Artist.destroy(permitted_params[:id])
      end
    end
  end
end