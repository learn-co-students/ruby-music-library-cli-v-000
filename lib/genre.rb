class Genre
  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
    @name  = name
    @songs = []
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

  def self.create(genre_name)
    g = Genre.new(genre_name)
    g.save
    g
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
  end

  def artists
    self.songs.collect{|s| s.artist }.uniq
  end
end
