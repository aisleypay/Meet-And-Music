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

  def self.order_by_genres(band_genres, artists)
    artists.select do |a|
      artist_genres = a.genres.collect(&:name)
      artist_genres.any? { |genre| band_genres.include?(genre) }
    end
  end

  # instruments are an array
  def self.selected_by_instruments_artists(artists, instruments_needed)
    artists.select do |a|
      artist_instruments = a.instruments.collect(&:name)
      artist_instruments.any? { |instrument| instruments_needed.include?(instrument) }
    end
  end

  def self.recommendedArtists(coordinates, radius, band_genres, instruments_needed)
    geographically_selected_artists = search_artists_by_radius(coordinates, radius)
    instrument_selected_artists = selected_by_instruments_artists(geographically_selected_artists, instruments_needed)
    genre_sorted_artists = order_by_genres(band_genres, instrument_selected_artists)
  end
end
