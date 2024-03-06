module API
  class Base < Grape::Api
    mount API::V1::Base
  end
end