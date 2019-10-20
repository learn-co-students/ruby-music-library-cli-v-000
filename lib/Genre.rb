class Genre
  extend Concerns::Findable
  include Concerns::Instance

  attr_accessor :name
  attr_reader :songs

  def initialize(name)
    @name = name
    self.class.all << self
    @songs = []
  end

  @@all = []

  def self.all
    @@all
  end

  def add_song(song)
    if song.genre == nil
      song.genre = self
    end
    if song.genre == self && !@songs.include?(song)
      @songs << song
    end
  end

  def artists
    artists = @songs.collect {|song| song.artist }
    artists.uniq
  end 

end
