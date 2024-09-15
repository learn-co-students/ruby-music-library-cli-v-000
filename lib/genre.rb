class Genre
  extend Concerns::Findable

  attr_accessor :name, :artist, :song

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    song.genre = self if song.genre == nil
    @songs << song if !@songs.include?(song)
  end

  def songs
    @songs
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

  def artists
    @artists = []
    @songs.each do |song|
      if !@artists.include?(song.artist)
        @artists << song.artist
      end
    end
    return @artists
  end

end
