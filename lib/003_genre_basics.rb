class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

   def add_song(song)
    @songs << song if !@songs.include?(song)
    song.genre = self if song.genre == nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def artists
    artists = []
    @songs.each {|s| artists << s.artist if !artists.include?(s.artist) }
    artists
  end

end 
