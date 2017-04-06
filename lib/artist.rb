class Artist
  extend Findable::ClassMethods
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  #constructor that extends initialize, replaced the sandwich wrapper with the tap method, including the name argument
  def self.create(name)
    Artist.new(name).tap do |artist|
      artist.save
    end
  end

  def add_song(song)
    #does this song already exist in @songs?
    if !songs.include?(song)
      songs << song
    end
    #does the song already have an assigned artist?
    if !song.artist
      song.artist = self
    end
  end

  def genres
    #binding.pry
    self.songs.collect{ |song| song.genre}.uniq
  end

end
