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
    if song.genre == nil
      song.genre = self
    end
    if self.songs.include?(song) == false
      self.songs << song
    end
  end

  def artists
    artists = self.songs.collect {|songs| songs.artist}
    artists.uniq
  end
end
