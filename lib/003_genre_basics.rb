require 'pry'
class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs


  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    Genre.new(name)
  end

  def songs
    @songs
  end

  def artists
    artist_array =  @songs.collect do |song|
      song.artist
    end
    artist_array.uniq
  end


end

# rspec spec/003_genre_basics_spec.rb
# rspec spec/006_artists_and_genres_spec.rb
# rspec spec/007_findable_songs_spec.rb
