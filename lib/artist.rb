require "pry"

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
      new = Artist.new(name)
      @@all << new
      new
  end

  def add_song(song)
    unless @songs.include?(song)
      @songs << song
    end

    if song.artist.nil?
      song.artist = self
    end
    @songs
  end

  def genres
    genres = []
    self.songs.uniq.collect do |song|
      genres << song.genre
    end
    genres.uniq
  end

end

# rspec spec/002_artist_basics_spec.rb
# rspec spec/004_songs_and_artists_spec.rb
# rspec spec/006_artists_and_genres_spec.rb
