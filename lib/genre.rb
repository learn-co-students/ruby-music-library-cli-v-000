class Genre
  attr_accessor :name
  attr_reader :songs

  extend Concerns::Findable

  @@all = [] #Class variable that stores all instances of the Genre class.

  def initialize(name) #initializes a new instance of the Genre class. Genre initializes with a name and an empty @songs array.
    @name = name
    @songs = []
  end

  def self.all #Returns the class variable for Genre.
    @@all
  end

  def self.destroy_all #Empties the @@all array.
    @@all.clear
  end

  def save #Pushes a new instance of the Genre class into the @@all array.
    @@all << self
  end

  def self.create(name) #Custom constructor that instantiates a new instance of Genre, and invokes the save method to push it into the @@all array.
    self.new(name).tap {|genre| genre.save}
  end

  def add_song(song) #Pushes a song into the @songs array. Only includes songs that are not present already.
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre == self
  end

  def artists #Returns a collection of artists for all of the genre's songs.
    songs.map {|song| song.artist}.uniq
  end
end
