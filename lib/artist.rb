require 'pry'

class Artist 
  
  attr_accessor :name, :song, :genre
  attr_reader :songs

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
  end
  
  def genres
    # binding.pry
    # songs.collect{ |s| s.genre }.uniq
    @genres = []
     songs.map { |song|
      @genres << song.genre
    }
    @genres.uniq
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.create(artistName)
    artist = self.new(artistName)
    artist.save
    artist
  end
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    songs << song unless songs.include?(song)
  end
end

