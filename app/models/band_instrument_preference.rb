class BandInstrumentPreference < ApplicationRecord
  belongs_to :band
  belongs_to :instrument
end
