class Artist
  attr_accessor :name
  attr_writer :songs

  extend Concerns::Findable

  @@all = [] #Class variable that stores all instances of the Artist class.

  def initialize(name) #initializes a new instance of the Artist class. Artist initializes with a name and an empty @songs array.
    @name = name
    @songs = []
  end

  def self.all #Returns the class variable for Artist.
    @@all
  end

  def self.destroy_all #Empties the @@all array.
    @@all.clear
  end

  def save #Pushes a new instance of the Artist class into the @@all array.
    @@all << self
  end

  def self.create(name) #Custom constructor that instantiates a new instance of Artist, and invokes the save method to push it into the @@all array.
    self.new(name).tap {|artist| artist.save}
  end

  def songs #Returns the @songs array.
    @songs
  end

  def genres #Iterates through the @songs array, returning a collection of genres for all of the artist's songs. Does not return duplicates.
    songs.map {|song| song.genre}.uniq
  end

  def add_song(song) #Pushes a song into the @songs array. Only includes songs that are not present already.
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end
end
