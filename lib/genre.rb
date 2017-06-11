class Genre
  extend Concerns::Findable

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

  def self.destroy_all
    @@all = []
  end

  def add_song(song)
    @songs << song if !songs.include?(song)
    song.genre = self if !song.genre
  end

  def songs
    @songs
  end

  def self.create(songname)
    song = self.new(songname)
    song.save
    song
  end

  def artists
    artists = []
    @songs.each {|song| artists << song.artist }
    artists.uniq
  end

  def self.print_all
      @@all.each {|genre| puts "#{genre.name}"}
  end

end
