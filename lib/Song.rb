require 'pry'

class Song

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    if genre!=nil
      self.genre.songs << self unless self.genre.songs.include?(self)
    end
    if artist!=nil
      self.artist.add_song(self)
    end
    #self.artist.songs << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(input)
    song = Song.new(input)
    song.save
    song
  end

  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless self.genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.select {|x| x.name == name}[0]
  end

  def self.find_or_create_by_name(name)

    if find_by_name(name)==nil
      Song.new(name).save
    else
      find_by_name(name).name = name
    end
    name
    #binding.pry
  end

end