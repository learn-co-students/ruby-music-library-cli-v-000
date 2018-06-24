class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs, :artists

  @@all = []

  def initialize(name)
    @name = name
    @songs = []

  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self unless song.genre
    #assign Genre instance to song class genre attribute unless song has an genre class.
    @songs << song unless @songs.include?(song) #song object is being pushed to array not genre attr.
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
    song = new(name)
    song.save
    song #was giving a nested array and was expecting a song return
  end

  def artists
    songs.map(&:artist).uniq
    #makes a map or a collection unique artist attributes of each song
  end


end
