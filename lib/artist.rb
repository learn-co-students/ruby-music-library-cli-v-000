class Artist

  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    end

    if !@songs.include?(song)
      @songs << song
    end
  end

  def genres
    genres = []
    @songs.each do |song|
      genres << song.genre
    end
     genres.uniq
   end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def count
    @@all.size
  end

end
