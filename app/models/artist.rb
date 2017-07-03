class Artist < ApplicationRecord
  geocoded_by :zipcode
  after_validation :geocode
  has_one :user, as: :meta, dependent: :destroy
  has_many :user_genres, dependent: :destroy
  has_many :genres, through: :user_genres
  has_many :artist_instruments, dependent: :destroy
  has_many :instruments, through: :artist_instruments
  accepts_nested_attributes_for :user, :genres, :instruments, :user_genres, :artist_instruments

  def self.search_artists_by_radius(coordinates, radius)
    Artist.near(coordinates, radius)
  end

  # instruments are an array
  def self.selected_by_instruments_artists(artists, instruments_needed)
    artists.select do |a|
      artist_instruments = a.instruments.collect(&:name)
      artist_instruments.any? { |instrument| instruments_needed.include?(instrument) }
    end
  end

  def self.order_by_genres(band_genres, artists)
    sorted_artists = []

    band_genres.each_with_index do |genre1, idx1|
      if idx1.zero?
        artists.each_with_index do |a, idx2|
          artist_genres = a.genres.collect(&:name)
          if artist_genres[idx1] == genre1
            sorted_artist = artists.delete_at(idx2)
            sorted_artists.push(sorted_artist)
          end
        end

      else
        artists.each_with_index do |a, idx2|
          artist_genres = a.genres.collect(&:name)

          if artist_genres.slice(0, idx1).include?(genre1)
            sorted_artist = artists.delete_at(idx2)
            sorted_artists.push(sorted_artist)
          end
        end
      end
    end

    sorted_artists.concat(artists)

    # artists.select do |a|
    #   artist_genres = a.genres.collect(&:name)
    #   artist_genres.any? { |genre| band_genres.include?(genre) }
    # end
  end

  def self.recommendedArtists(coordinates, radius, band_genres, instruments_needed)
    geographically_selected_artists = search_artists_by_radius(coordinates, radius)
    instrument_selected_artists = selected_by_instruments_artists(geographically_selected_artists, instruments_needed)
    order_by_genres(band_genres, instrument_selected_artists)
  end

  def self.search_artists(zipcode, radius, instrument, genre)
    selected_artists = search_artists_by_radius(zipcode, radius)

    if instrument == 'All'
      return selected_artists if genre == 'All'

    else
      instrument_selected = selected_artists.select do |a|
        artist_instruments = a.instruments.collect(&:id)
        artist_instruments.include?(instrument.to_i)
      end

      return instrument_selected if genre == 'All'

      instrument_selected.select do |a|
        artist_genres = a.genres.collect(&:id)
        artist_genres.include?(genre.to_i)
      end
    end
  end
end
