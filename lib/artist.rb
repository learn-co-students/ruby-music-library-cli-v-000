class Artist
  extend Concerns::Findable

  attr_accessor :name, :song, :genre, :songs

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
    @@all.clear
  end

  def self.create(name)
     x = self.new(name)
     x.save
     x
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song if !@songs.include?(song)
  end

  def songs
    @songs
  end

  def genres
    @genres = []
    self.songs.each do |song|
      if !@genres.include?(song.genre)
        @genres << song.genre
      end
    end
    return @genres
  end

end
