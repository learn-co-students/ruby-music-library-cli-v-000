require 'pry'

class Song
  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    artist=(artist) unless artist = nil
    @genre = genre
  end

  def artist=(artist)
    # if artist != nil
      @artist = artist
      artist.add_song(self.name)
    # end
  end

  def self.all
    @@all
    # binding.pry
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    s = new(name)
    s.save
    s
  end

  def self.find_by_name(name)
    @@all.find { |song_name| song_name == name }
  end

  def self.find_or_create_by_name(name)
    s = self.find_by_name(name)
    if s = nil
      self.create(name)
    else
      s
    end
  end

end
