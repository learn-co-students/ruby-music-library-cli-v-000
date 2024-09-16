require_relative "../lib/concerns/findable.rb"

class Artist
  extend Concerns::Findable
  include Concerns::InstanceMethods
  attr_accessor :name
  @@all = []

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
    new(name).tap{|artist_name| artist_name.save} #Using the Tap method here is much cleaner than creating a new instance and saving that instance and then calling that instance...Tap allows you to 'tap' into the method chain. New is created with the argument of the name passed in and then save the new instance (the newly created instance of the artist's name).
  end

  def songs
    @songs
  end

  def genres
    self.songs.collect{|s| s.genre}.uniq #(same as the artists method in the genre class).
  end

#Artists HAVE MANY songs and songs BELONG to artists.
  def add_song(song)  #Add the instance of the song to the @songs array (but do NOT add duplicated)
    if @songs.include?(song) == false #So, check first to see if it has been added yet or not.
    @songs << song #Push the song into the array if it has not been added yet
    song.artist = self if song.artist == nil  #If no artist (nil) then the Song's artist is self (this instance of the song/artist) Associates the two. else nil #If else (i.e. song is already included in the array, do not add it.)
    end
  end
end
