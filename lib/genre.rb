require_relative "../lib/concerns/findable.rb"
require "pry"

class Genre
  extend Concerns::Findable #Use Extend for Class Methods.
  include Concerns::InstanceMethods #allows you to remove the initialize method from genre and artist.
  attr_accessor :name #Need to both read and write Name.
  @@all = [] #Create an empty array to store genres. Class Variable (scope in instance and class methods).

  def save #Save each instance of the genre class (self) into the @@all array.
    @@all << self
  end

  def self.all #Create a writer for the @@all array to view contents.
    @@all
  end

  def self.destroy_all #Empty the array.
    @@all.clear
  end

  def self.create(name) #Create a new instance. Call the .new method and then the .save and then return that newly created instance.
    genre = Genre.new(name) #creates new instance based on the new name passed in
    genre.save #Saves this instance (calls on the save method I defined above)
    genre
  end

  def songs #Create instance var for songs.
    @songs
  end

  def artists #Instance Method. Returns a collection of artists for all of the genre's songs (genre has many artists through songs)
    #binding.pry
    @songs.collect {|s| s.artist}.uniq
    # .uniq will delete an duplicate artists (if the genre has more than one songby a particular artist)
  end
end
