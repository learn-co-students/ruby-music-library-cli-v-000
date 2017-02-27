require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist="", genre="")
    @name = name
    @artist = artist
    @genre = genre
    genre.songs << self if genre != "" #adds genre to genre's songs collection if.... my brain IS melting. Need a break D:
    artist.songs << self if artist != ""
  end

  def self.all
    @@all
  end

  def artist=(artist) #song.artist = artist <-nope
    @artist = artist
    artist.add_song(self) #fun_song = Song.new => fun_song.artist=(Whomever) => Whomever.add_song(fun_song)
  end

  def self.destroy_all
    @@all = [] #still can't think of why .clear is any better..
  end

  def save
    @@all << self #still not quite clear on why self.class.all works. vs. self.all. for now, @@all <<self, later probably need abstraction of .class
  end

  def genre=(genre)
    @genre = genre
    genre.songs << (self) unless genre.songs.include?(self) #I think my brain is melting.
  end

  def self.create(name, artist="", genre="")
    created_song = Song.new(name, artist, genre)
    created_song.save
    return created_song #do not get why I need to return this?
  end

  def self.new_from_filename(filename)
    namesects = filename.split " - "
    namesects[2] = namesects[2].split(".").shift #getting rid of .mp3
    #binding.pry
    artist = Artist.find_or_create_by_name(namesects[0]) #song.artist= namesects[0]
    genre = Genre.find_or_create_by_name(namesects[2]) #song.genre= namesects[2]
    create(namesects[1], artist, genre) #song = Song.new(namesects[1])
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

end
