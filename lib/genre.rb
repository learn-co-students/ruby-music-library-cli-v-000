class Genre
  attr_accessor :name, :song
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  def save
    @@all << self
  end
  def add_song(song)
    if !self.songs.include?(song)
      @songs << song
    end
    if !song.genre
      song.genre = self
    end
  end
  def songs
    @songs
  end
  def artists
    self.songs.collect{|s|
      s.artist
    }.uniq
  end
  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end
  def self.destroy_all
    @@all.clear
  end
  def self.all
    @@all
  end
end
