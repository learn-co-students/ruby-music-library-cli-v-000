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

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
    #self.new(name).tap do |genre|
    #genre.save
    #end
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.genre != self
      song.genre = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end

  def artists
    artists = @songs.collect do |song|
      song.artist
    end
    artists.uniq
  end

end
