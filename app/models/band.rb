class Band < ApplicationRecord
  geocoded_by :zipcode
  after_validation :geocode
  has_one :user, as: :meta, dependent: :destroy
  has_many :user_genres, dependent: :destroy
  has_many :genres, through: :user_genres
  has_many :band_instrument_preferences, dependent: :destroy
  accepts_nested_attributes_for :user, :genres, :band_instrument_preferences, :user_genres

  def self.search_bands_by_radius(coordinates, radius)
    Band.near(coordinates, radius)
  end

  def self.selected_by_needed_instruments(bands, artist_instruments)
    bands.select do |b|
      b_preferred_instruments = b.band_instrument_preferences.collect { |p| p.instrument.name }
       artist_instruments.any? { |a_instrument| b_preferred_instruments.include?(a_instrument) }
    end
  end

  def self.order_by_genres(artist_genres, bands)
    sorted_bands = []

    artist_genres.each_with_index do |genre1, idx1|
      if idx1.zero?
        bands.each_with_index do |a, idx2|
          band_genres = a.genres.collect(&:name)
          if band_genres[idx1] == genre1
            sorted_artist = bands.delete_at(idx2)
            sorted_bands.push(sorted_artist)
          end
        end

      else
        bands.each_with_index do |a, idx2|
          band_genres = a.genres.collect(&:name)

          if band_genres.slice(0, idx1).include?(genre1)
            sorted_artist = bands.delete_at(idx2)
            sorted_bands.push(sorted_artist)
          end
        end
      end
    end

    sorted_bands.concat(bands)
  end

  def self.recommendedBands(coordinates, radius, artist_instruments, artist_genres)
    geographically_selected_bands = search_bands_by_radius(coordinates, radius)
    instrument_selected_bands = selected_by_needed_instruments(geographically_selected_bands, artist_instruments)
    order_by_genres(artist_genres, instrument_selected_bands)
  end

  def self.search_bands(zipcode, radius, genre)
    selected_bands = search_bands_by_radius(zipcode, radius)
    return selected_bands if genre == 'All'

    selected_bands.select { |b| b.genres.collect(&:id).include?(genre.to_i) }
  end
end
