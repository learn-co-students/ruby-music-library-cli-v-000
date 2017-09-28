class Artist
  attr_accessor :name
  attr_reader :songs
  extend Concerns::Findable

  @@all = []
  def initialize(name)
    @name = name    #name attribute passed through for new instances
    @songs = []     #array to collect song instances of an artist instance
  end

  def self.all      #reader method for class variable @@all
    @@all
  end

  def save            #stores artist instances in class variable @@all
    @@all << self
  end

  def self.destroy_all  #class method empties stored instances in class variable @@all
    @@all.clear
  end

  def self.create(name)   #custom constructor creates an instance, stores it in class variable @@all, and returns instance
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist = self if song.artist.nil?  #song instance calls artist reader method and assigns itself
    self.songs << song unless self.songs.include?(song)    #artist instance adds song instance to instance variable @songs
    song                  #returns song instance added to instance variable @songs
  end

  def genres
    self.songs.map {|song| song.genre}.uniq
  end

end
