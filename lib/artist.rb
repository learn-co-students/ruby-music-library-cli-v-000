class Artist

  attr_accessor :name, :songs
  extend Concerns::Findable

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
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    # if song.artist == nil
    #   song.artist = self
    # end
    song.artist = self unless song.artist == self
    if !(self.songs.detect {|s| s == song})
      self.songs << song
    end
  end

  def genres
    genres = []
    self.songs.each do |song|
      genres << song.genre unless genres.include?(song.genre)
    end
    genres
  end

end
