require 'pry'
class Artist
extend Concerns::Findable

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def add_song(song)

    if song.artist == nil
      song.artist=self
    end
    if ! @songs.include?(song)
      @songs << song
    end
    #binding pry
  end

  def genres
    genres = []
    @songs.each do |song|
      genres << song.genre
    end
    genres.uniq
  end

end
