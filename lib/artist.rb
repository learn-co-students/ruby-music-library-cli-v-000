require "pry"
class Artist

  attr_accessor :name, :songs

  @@all =[]

  def initialize(name)
    @name = name
    @@all << self
    @songs =[]

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << Song.new(name)
  end

  # instantiates an instance using .new but also evokes #save on that instance, forcing it to persist immediately.
  def self.create(artist)
    artist = Artist.new(name)
    artist.save
    artist
  end

  # artist has many songs.
  def add_song(song)
    @songs << song
    if @songs.include?(@artist)
      song.artist != self
    else
      song.artist = self
    end
    # binding.pry
  end
end
