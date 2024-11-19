class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(n)
    @name = n
    @songs = []
  end

  def save
    self.class.all << self
  end

  def songs
    @songs
  end

  def genres
    genre_list = []
    @songs.each do |s|
      genre_list << s.genre if !(genre_list.include?(s.genre))
    end
    return genre_list
  end

  def add_song(s)
    if s.artist === :unknown
      s.artist = self
    end
    if !(self.songs.include?(s))
      self.songs << s
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(n)
    artist = Artist.new(n)
    self.all << artist
    artist
  end
end
