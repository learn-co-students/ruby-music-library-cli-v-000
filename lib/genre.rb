class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    tmp = []
    @songs.each {|song| tmp << song.artist if !tmp.include?(song.artist) }
    tmp
  end


  def save
      @@all << self
  end

  def add_song(song)
    song.genre = self if !song.genre
    @songs << song if !@songs.include?(song)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

end
