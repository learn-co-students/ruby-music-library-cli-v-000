require 'pry'

# create class Song
class Song 
  
  extend Concerns::Findable
# create attr_accessor for name
  attr_accessor :name
  attr_reader :genre
  
# create @@all = [] - class variable
  @@all = []
# create initialize method w/argument (name)
  def initialize(name, artist = nil, genre = nil) # second default argument 
    @name = name
    self.artist=artist if artist != nil
    self.genre=genre if genre != nil
  end 

# create class methods for:
    # - self.all
  def self.all 
    # - this method will return contents of @@all array
    @@all
  end 
    # - self.destroy_all 
  def self.destroy_all
    # - set @@all to an empty array
    @@all = []
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end 
  
  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end
# create save instance method
  def save 
#  # - this method will add Song instances to the @@all array
    @@all << self 
  end 
# create self.create class method 
#    def self.create(name)
#    # - this will initialize a new song and save the song in the @@all array 
#      song = Song.new(name)
#      @@all << song
#      song
#    end
   
#  def self.find_by_name(name) # class method
#      # searches the extended class' @@all array for an instance that matches the provided name 
#        @@all.find do |song|
#        song.name == name 
#  end 
#  end 
  
#  def self.find_or_create_by_name(name)
#      # class method
#      # finds an existing instance with the name provided if one exists in @@all array
#      # returns a song existence with name if one exists in @@all array
#      self.find_by_name(name) || self.create(name)
#   end 
#  
end






















