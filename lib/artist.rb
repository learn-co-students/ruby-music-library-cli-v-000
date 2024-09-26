


class Artist
  extend Concerns::Findable

  attr_accessor :artist, :songs
  @@all = []


  def initialize(name)
    @name = name
    @songs = []

  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.collect do |song| song.genre
    end.uniq
  end

end
