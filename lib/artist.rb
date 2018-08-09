class Artist
  extend Concerns::Findable

  @@all = []

  attr_accessor :name, :artist
  # attr_reader :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    end
    if @songs.include?(song) != true
      @songs << song
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def genres
    genres = @songs.collect do |song|
      song.genre
    end
    genres.uniq
  end


end
