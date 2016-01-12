class Artist
  attr_accessor :name
  attr_reader :songs
  extend Concerns::Findable
  
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
  end

  def add_song(song)
    self.songs << song
    song.artist = self if song.artist.nil?
    self.songs.uniq!
  end

  def genres
    genres = self.songs.collect {|s| s.genre}
    genres.uniq
  end

end 