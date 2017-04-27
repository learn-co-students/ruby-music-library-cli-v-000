#####initialize with #name
#accepts a name for the song
#####name=
#sets the artist name
#####.all
#returns the class variable @@all
#####.destroy_all
#resets the @@all class variable to an empty array
#####save
#adds the artist instance to the @@all class variable
#####.create
#initializes and saves the artist

class Artist

#####Concerns::Findable
#defines a module Concerns::Findable
#adds a find_by_name class method to classes that are extended by the module
#adds a find_or_create_by_name class method to classes that are extended by the module
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    Artist.new(name).tap do |new_artist|
      new_artist.save
    end
  end

#####add_song
#adds the song to the artist's song collection
#assigns the artist to the song
#does not assign the artist to the song if the song already has the artist
#does not add the song to the artist's song collection if the artist already has the song
  def add_song(song)
    if self.songs.include?(song) == false
    self.songs << song unless
    song.artist = self
    end
  end

  def save
    @@all << self
  end

#####genres
#returns the unique genres belonging to all the songs of the artist
#returns only unique genres for an artist if more than one song has the same genre
#does not use an instance variable @genres and collects genres from songs everytime
  def genres
    outs = self.songs.collect do |song|
      song.genre
    end
    outs.uniq
  end
end
