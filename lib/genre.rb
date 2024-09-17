class Genre

  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)   #genre adds song to genre instance's array unless it's already there
    song.genre = self unless song.genre == self   #genre assigns new song's genre to itself unless already assigned
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq  #iterates through genre's song array and returns array of unique artists
  end

end
