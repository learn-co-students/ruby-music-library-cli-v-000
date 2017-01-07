class Song
 # Take all of the methods in the Findable module and then add them to clas methods

  attr_accessor :name, :artist

  @@all =[]

  def initialize(name, artist= nil)
  
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = Song.new(name)
      self.all << song
    return song
  end

  def artist=(artist_name)
   @artist = artist_name
   @artist.add_song(self)
 end


end

