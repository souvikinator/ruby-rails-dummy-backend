module Api::V1::Entities
  class User < Api::V1::Entities::Base
    expose :id
    expose :username
    expose :bio
    expose :created_at
  end
end