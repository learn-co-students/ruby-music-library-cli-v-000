require_relative './concerns/findable.rb'

class Song
  extend Concerns::Findable
  attr_accessor :name  #each song's attributes
  attr_reader :artist, :genre
  @@all = [] #initialize collection of all class members as an empty array

  def initialize(name, artist = nil, genre = nil) #initialize with a name, store as name
    @name = name
    self.genre = genre if genre
    self.artist = artist if artist
  end

  def save #pushes the instance onto the class var @@all
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs.any? { |i| i == self } ? self : genre.songs << self
  end

  def self.all #class var @@all reader
    @@all
  end

  def self.destroy_all #clears class var @@all
    @@all.clear
  end

  def self.create(name) #instantiates a new class member by calling initialize and then saves it by calling save
    new(name).tap{ |i| i.save }
  end

  def self.new_from_filename(filename)
    new_song = (filename.sub /[.]+?\S+\Z/, "").split("-")
    new_song_name = new_song[1].strip
    new_song_artist = new_song[0].strip
    2.times {new_song.shift}
    new_song_genre = new_song.join("-").strip

    artist = Artist.find_or_create_by_name(new_song_artist)
    genre = Genre.find_or_create_by_name(new_song_genre)
    new(new_song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{|i| i.save}
    #does the same as new_from_filename but also saves the song to @@all
  end

  def self.find_by_name(name)
    self.all.detect { |member| member.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
end
