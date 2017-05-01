require "pry"
class Artist
  # below we extracting some common functionality of the Findable module into the class
  extend Concerns::Findable # Folder::Filename:  ruby's convention of namespacing modules
  attr_accessor :name, :songs
  @@all =[]

  def initialize(name)
    @name = name
    @songs =[]
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

  # instantiates an instance using .new but also evokes #save on that instance, forcing it to persist immediately.
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  # artist has many songs.
  def add_song(song)
    if song.artist!=self
      song.artist = self
    elsif !@songs.include?(song)
      @songs << song
    end
  end

  # artist have many gnres through songs
  def genres
    songs.collect{|song| song.genre}.uniq
  end

end
