module Api::V1::Helpers::Artist
  extend ActiveSupport::Concern
  included do
    helper do
      def get_all_artists
        artists = Artist.all
        present artists
      end
      def get_artist(id:Integer)
        artist = User.find_by!(id:id)
        present artist
      end
    end
  end
end