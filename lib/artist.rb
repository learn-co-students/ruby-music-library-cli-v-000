class Artist

  attr_accessor :name
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def genres
    @songs.map do |sng|
        sng.genre
    end.uniq
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(artist_name)
    artist = self.new(artist_name)
    artist.save
    artist
  end

end
