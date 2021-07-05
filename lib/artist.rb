
class Artist
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
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

  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)
    unless songs.include?(song)
      @songs << song
    end
    unless song.artist != nil
      song.artist = self
    end
  end

  def songs
    @songs
  end

  def genres
    @genres = []
    self.songs.each do |song|
      @genres << song.genre
    end
    @genres.uniq
  end


end
