class Artist

attr_accessor :name

@@all = []

  def initialize(name)
    @name = name
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

  def self.create(name)
    artist = self.new(name)
    artist.save
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist != ""
      song.artist = self
      @songs << song
    elsif @songs.include?(song)
    else
      @songs << song
    end
  end

end
