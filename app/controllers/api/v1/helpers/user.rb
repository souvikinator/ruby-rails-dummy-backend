module Api::V1::Helpers::User
  extend Grape::API::Helpers

  def get_all_users
    users = User.all
    present users, with: Api::V1::Entities::User
  end

  def get_user(id)
    # user = Rails.cache.fetch("user:#{id}", expires_in: 12.hours) do
    #   # User.super_admins.pluck(:id)
    #   User.where(id: id).first!
    # end
    value = Rails.cache.fetch("user:#{id}", expires_in: 12.hours)
    # byebug
    if value
      p "cache hit user:#{id}"
      user = Marshal.load(value)
    else
      p "cache miss user:#{id}"
      user = User.where(id: id).first!
      st = Marshal.dump(user)
      Rails.cache.write("user:#{id}", st)
      # byebug
    end

    present user, with: Api::V1::Entities::User
  end
end