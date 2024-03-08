module Api::V1
    class Base < Grape::API
      mount Api::V1::Users
      # mount API::V1::Artists
      mount Api::V1::Songs
      # mount API::V1::Follows
    end
end