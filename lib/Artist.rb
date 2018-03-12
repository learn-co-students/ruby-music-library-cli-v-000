class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs, :genre

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def genres
    @songs.collect{ |s| s.genre }.uniq
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def save_song(song)
    @songs << song
  end

  def self.create(name)
    artist = Artist.new(name)
  end

  def add_song(song)
      song.artist = self unless song.artist
      save_song(song) unless songs.include?(song)
    end



end
