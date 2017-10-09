class Genre

  @@all = []
  extend Concerns::Findable
  attr_accessor :name

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
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = self.new(name)
    @@all << genre
    genre
  end

  def artists
    artist_array = []
    self.songs.collect{|song| artist_array << song.artist}
    artist_array.uniq
  end


end
