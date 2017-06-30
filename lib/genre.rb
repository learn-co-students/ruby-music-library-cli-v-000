class Genre
  attr_accessor :name
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
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
    g = Genre.new(name)
    g.save
    g
  end

  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
    end
    if song.genre == nil
      song.genre = self
    end
  end

  def artists
    songs.collect do |s|
      s.artist
    end.uniq
  end

end
