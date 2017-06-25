class Song

  extend Concerns::Findable

  attr_accessor :name, :genre, :artist #name property readable and writeable by object

  @@all= [] #class variable, prepared to store all aved instances

  def initialize(name, artist = nil, genre = nil) #sets name on initialization
    @name= name  #sets property correctly
    @songs= []
    artist.add_song(self) if artist
    genre.add_song(self) if genre
  end

  def self.all
    @@all
  end

  def save #method adds instance itself into the class variable @@all
    @@all << self
  end

  def self.destroy_all #method empties all array of @@all
    @@all.clear
  end

  def self.create(name)
    song= Song.new(name)  #instantiate an instance using .new
    song.save  #evokes save on the instance created
    song  #calls the genre immediately
  end

  def self.find_by_name(name)

  end

  def self.find_or_create_by_name(name)

  end

  def artist= (artist)
    @artist= artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre= genre
    genre.songs << self unless genre.songs.include?(self)
  end

end
