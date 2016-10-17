class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    save
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
    end
    if song.artist != self
      song.artist = self
    end
  end

  def self.create(artist)
    Artist.new(artist).save
    self
  end

  def genres
    genres = songs.collect do |song|
      song.genre
    end
    genres.uniq
  end

end
