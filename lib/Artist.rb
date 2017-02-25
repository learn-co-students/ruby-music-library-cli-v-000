class Artist
  extend Concerns::Findable
  include Concerns::Instance

  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    self.class.all << self
    @songs = []
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if song.artist == self && !@songs.include?(song)
      @songs << song
    end
  end

  def songs
    @songs
  end

  def genres
    genres = @songs.collect {|song| song.genre }
    genres.uniq
  end

end
