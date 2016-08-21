class Artist
  extend Concerns::Findable
  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
    end
    if song.artist != self
      song.artist = self
    end
  end

  def genres
    genres = []
    songs.each {|song| genres << song.genre}
    genres.uniq
  end

end
