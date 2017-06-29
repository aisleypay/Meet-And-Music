class BandBandInstrumentPreferencesSerializer < ActiveModel::Serializer
  attributes :id, :instrument
  has_many :instruments
end
