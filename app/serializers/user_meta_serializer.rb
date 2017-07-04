class UserMetaSerializer < ActiveModel::Serializer
  attributes :id, :name, :state, :zipcode, :setList, :radius_preference, :profile_pic, :youtube_playlist_link, :genres
  attribute :instruments, if: :artist?
  attribute :experience_in_years, if: :artist?
  attribute :age, if: :artist?
  attribute :band_instrument_preferences, if: :band?

  def artist?
    object.is_a?(Artist)
  end

  def band?
    object.is_a?(Band)
  end
end
