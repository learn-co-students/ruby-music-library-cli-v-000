class Artist
  extend Concerns::Findable
  attr_accessor :name, :song

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
   unless @@all.include? self
     self.class.all << self
   end
  end

  def self.create(artist_name)
    artist = self.new(artist_name)
      artist.name = artist_name
      artist.save
      artist
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless songs.include?(song)
  end

  def genres
    @songs.collect { |song| song.genre }.uniq
  end

end
