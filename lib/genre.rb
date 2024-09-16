#####initialize with #name
#accepts a name for the genre
#####name=
#sets the genre name
#####.all
#returns the class variable @@all
#####.destroy_all
#resets the @@all class variable to an empty array
#####save
#adds the genre instance to the @@all class variable
#####.create
#initializes and saves the genre

class Genre

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

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).tap{|genre| genre.save}
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
  end

#####artists
#returns only unique artists for a genre when artists have multiple songs
#does not use an instance variable @artists and collects artists from songs everytime
  def artists
    outs = self.songs.collect do |song|
      song.artist
    end
    outs.uniq
  end
end
