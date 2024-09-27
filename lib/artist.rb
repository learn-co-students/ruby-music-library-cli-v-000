class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def genres
    genres = @songs.map{|song| song.genre}
    genres.uniq
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
    artist = Artist.new(name)
    artist
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end

end
