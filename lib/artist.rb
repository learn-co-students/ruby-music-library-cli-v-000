class Artist
  attr_accessor :name           #retrieves the name of an artist and set it a new name
  attr_reader   :songs          #returns the artist's 'songs' collection
  extend Concerns::Findable     #extends the Concerns::Findable module class methods 
  @@all = []                    #class variable all in Artist is initialized as an empty array to store all Artist instances

  def initialize(name)          #accepts a name for the new artist
    @name = name
    @songs = []                 #initialize a songs property set to an empty array
  end

  def self.all                  #returns the class variable @@all
    @@all
  end

  def self.destroy_all          #resets the @@all class variable to an empty array
    @@all.clear
  end

  def save                      #adds the Artist instance to the @@all class variable
    @@all << self
  end

  def self.create(instance)     #Artist.create initializes and saves the artist instance to @@all
    artist = Artist.new(instance)
    artist.save
    artist
  end

  def add_song(song)                                       #assigns the current artist to the song's 'artist' property
    song.artist = self if song.artist.nil?                 #does not assign the artist if the song already has an artist
    self.songs << song unless self.songs.include?(song)    #adds the song to the current artist's 'songs' collection unless the song already exits in collection
  end

  def genres                                  #returns a collection of genres for all of the artist's songs and collects genres through its songs instead of maintaining its own @genres instance variable
    self.songs.map {|song| song.genre}.uniq   #does not return duplicate genres if the artist has more than one song of a particular genre
  end
end


# rspec --f-f
