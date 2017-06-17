class Artist
  attr_accessor :name, :songs

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

  def self.create(artist_name)
    artist = Artist.new(artist_name)
    @@all << artist
    artist
  end

  def add_song(song)
  # binding.pry
    if song.artist == self
    else
      song.artist = self
    end
    if @songs.include?(song)
    else
      @songs << song
    end
  end
end
