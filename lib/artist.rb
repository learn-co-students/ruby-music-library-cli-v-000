# The Artist class will be responsible for either creating the artist
#(if the artist doesn't exist in our program yet) or finding the instance of that artist (if the artist does exist).
class Artist

  attr_accessor :name, :songs, :genres

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def genres
    @songs.collect{|s| s.genre}.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  # def self.create(name)
  #   new_artist = Artist.new(name)
  #   new_artist.save
  #   new_artist
  # end

  def songs
    @songs
  end

  # has many relationship
  def add_song(song)
    # assigns the current artist to the song's 'artist' property (song belongs to artist)
    song.artist = self unless song.artist == self

    @songs << song unless @songs.include?(song)

  end

  # It will probably be useful to create a couple of helper methods to assist with the methods below.
  #
  # Artist.find_or_create_by_name(name)
  # This class method should take the name that is passed in (remember, it will be a string), and do one of two things. Find the artist instance that has that name or create one if it doesn't exist. Either way, the return value of the method will be an instance of an artist with the name attribute filled out.
  #
  # Artist#add_song(song)
  # This instance method exists to tell the artist about its songs.
  # Simply take the Song instance that is passed in as an argument and store it in a songs array with all the other songs that belong to the artist.

  # def self.find_by_name(name)
  #   @@all.detect{|artist| artist.name == name}
  # end

end
