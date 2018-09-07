class Artist
 attr_accessor :name
 @@all = []
 extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
    # @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end

  def songs
   @songs
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
    if song.artist.nil?
      song.artist = self
    end
  end

  def genres
    songs.map do |song|
      song.genre
    end.uniq
  end
end
