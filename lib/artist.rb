class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.class.all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    if !self.songs.include?(song)
      self.songs << song
      if song.artist != self
        #binding.pry
        song.artist = self
      end
    end
  end

  def genres
    genres = self.songs.collect do |song|
      song.genre
    end
    genres.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    #binding.pry
    artist
  end
end
