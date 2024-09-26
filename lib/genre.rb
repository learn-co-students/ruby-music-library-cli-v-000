class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
  end

  def self.destroy_all
    self.all.clear
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song) # add song to list if not already there
    song.genre = self unless song.genre # set song's genre if not already set
  end

  def artists
    a = self.songs.collect{ |song| song.artist }
    a.uniq
  end

end
