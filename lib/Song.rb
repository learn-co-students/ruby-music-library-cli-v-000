class Song

  attr_accessor :name, :songs
  attr_reader :artist, :genre
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @artist = artist

  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
   self.all.clear
  end

  def self.create(name, artist = nil, genre = nil)
   song = Song.new(name)
   song.save
   song
  end

  def self.find_by_name(name)
    @@all.detect{|x| song.name == name}
  end

  def self.find_or_create_by_name(name)

  end

  def artist=(artist)
    @artist = artist
  end

  def genre=(genre, song = nil)
    @genre = genre
  end


end