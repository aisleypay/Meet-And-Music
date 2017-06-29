class BandInstrumentPreferenceSerializer < ActiveModel::Serializer
  attributes :id, :instrument_id
  belongs_to :instrument
  belongs_to :band
end
