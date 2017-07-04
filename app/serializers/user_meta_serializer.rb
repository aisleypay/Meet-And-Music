class UserMetaSerializer < ActiveModel::Serializer
  attributes :id, :name, :state, :zipcode, :setList, :genres, :radius_preference, :profile_pic
  attribute :instruments, if: :Artist?
  attribute :experience_in_years, if: :Artist?
  attribute :age, if: :Artist?

  def Artist?
    object.is_a?(Artist)
  end

end
