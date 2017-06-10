

class Genre
  extend Concerns::Findable
  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
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
    genre = Genre.new(name)
    self.all << genre
    genre
  end

  def add_song(song)
      @songs << song unless @songs.include?(song)
      song.genre = self unless song.genre == self
  end

  def artists
    tmp = []
    @songs.collect do |song|
      tmp << song.artist
    end
    tmp.uniq
  end



end
