require 'pry'

  class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = "Musician", genre = "Generic")
    @name = name
    self.genre=(genre) if genre != "Generic"
    self.artist=(artist) if artist != "Musician"
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


  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if genre.songs.include?(self) == false
  end

  def self.create(name) #1/3
    Song.new(name).tap {|song| song.save}
  end

  def self.find_by_name(name) #2/3
    @@all.detect {|song| song.name}
  end

  def self.find_or_create_by_name(name) #3/3
    # binding.pry
    # find_by_name(name) ? find_by_name(name) : create(name)
    find_by_name(name) || create(name)
  end

end
