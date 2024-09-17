class Genre
  attr_accessor :name, :artist, :song
  extend Concerns::Findable

  @@all = []

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
    self.class.all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save #save this instance
    genre #return
  end

  def songs
    @songs
  end

  def artists
    songs.collect {|song| song.artist
    }.uniq
  end

end
