class Genre
  attr_accessor :name

  @@all = []

  def self.all 
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    new_entry = self.new(name)
    new_entry.save
    new_entry
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end

  def artists
    artists = []
    @songs.collect do |song|
      artists << song.artist unless artists.include?(song.artist)
    end
    artists
  end
  
end