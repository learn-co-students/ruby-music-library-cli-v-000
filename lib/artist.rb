class Artist
  attr_accessor :name, :songs
  @@all = []

  extend Concerns::Findable

  def genres
    self.songs.collect{|s| s.genre}.uniq
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new_artist = new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.artist = self unless song.artist
  end

end
