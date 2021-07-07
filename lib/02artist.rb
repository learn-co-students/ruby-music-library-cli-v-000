class Artist

extend Concerns::Findable

attr_accessor :name, :songs

  @@all = []

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
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    instance = new(name)
    instance.save
    instance
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist
  end

  def genres
    self.songs.map {|song| song.genre}.uniq
  end
end
