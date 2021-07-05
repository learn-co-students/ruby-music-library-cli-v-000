class Artist
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
      song.artist = self unless song.artist
      @songs << song unless songs.include?(song)
  end

  def genres
    songs.collect {|g| g.genre}.uniq
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
      song = new(name)
      song.save
      song
  end

end
