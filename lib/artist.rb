class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
      song.artist = self
    end
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new = self.new(name)
    new.save
    new
  end

  def genres
    genres = []
    @songs.each do |song|
      if !genres.include?(song.genre)
        genres << song.genre
      end
    end
    genres
  end

end
