
class Genre
  extend Concerns::Findable

  @@genres = []
  attr_accessor :name

  def initialize(name)
    @name = name
    self.save
    @songs = []
  end

  def self.all
    @@genres
  end

  def save
    @@genres << self unless @@genres.include?(self)
  end

  def self.create(name)
    self.new(name)
  end

  def self.destroy_all
    self.all.clear
  end

  #HAS MANY

  def songs
    @songs
  end

  def add_song(song)
    if song.class != Song
      raise SongError
    else
      song.genre = self unless song.genre != nil
      @songs << song unless @songs.include?(song)
    end
  end

  def artists
    @songs.collect do |song|
      song.artist
    end.uniq
  end

  class SongError < StandardError
    def message
      "You must provide the add_song method an instance of the Song class"
    end
  end



end
