require 'pry'

class Song
  extend Concerns::Findable

  attr_accessor :name, :artist 
  attr_reader :genre

  @@all = []

  def initialize(name, artist= nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    #artist if artist != nil
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
    song = Song.new(name)
    song.save
    song
  end

  def artist=(name)
    @artist = name
    #name.songs << self
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)

    self.find_by_name(name) || self.create(name)

  end

  def self.new_from_filename(filename)
    parsed = filename.split(" - ")
    song = self.find_or_create_by_name(parsed[1])
    song.genre = Genre.find_or_create_by_name(parsed[2].gsub!(".mp3",""))
    song.artist = Artist.find_or_create_by_name(parsed[0])
    song
    #binding.pry
    #artist.add_song(name)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
    

  end


end