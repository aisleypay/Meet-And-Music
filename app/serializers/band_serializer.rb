class BandSerializer < ActiveModel::Serializer
  attributes :id, :name, :state, :zipcode, :setList, :profile_pic
  has_many :genres
  has_one :user
  has_many :band_instrument_preferences, serializer: BandBandInstrumentPreferencesSerializer
end
