require'pry'
class Song

  attr_accessor :song, :artist, :name, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    #if artist exist, then make self.artist
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    Song.new(name)
    @@all << self
    self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    all.each do |song|
      if song.name == name
        return song
      end
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end






end