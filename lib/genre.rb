class Genre
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
    self.new(name).tap {|o| o.save }
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless self.songs.include?(song)
    song.genre = self unless song.genre
  end

  def artists
    songs.collect {|s| s.artist}.uniq
  end

end
