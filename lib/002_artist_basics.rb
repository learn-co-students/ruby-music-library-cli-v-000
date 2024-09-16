class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def genres
    songs.map {|s| s.genre}.uniq
  end

  def add_song(song)
    if !song.artist
      song.artist = self
    end
    if @songs.include?(song) == false
      @songs << song
    end
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
