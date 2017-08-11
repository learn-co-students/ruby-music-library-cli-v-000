class Artist
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def name
    @name
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    if !songs.include?(song)
      songs << song
      if song.artist == nil
       song.artist = self
      end
    end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
end
