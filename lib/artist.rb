class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs, :genres

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
    new_artist = new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end

  def genres
    @genres = []
    @songs.each do |song|
      @genres << song.genre unless @genres.include?(song.genre)
    end
    @genres
  end

end
