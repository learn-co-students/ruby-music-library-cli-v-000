require_relative '../concerns/concerns.rb'

class Song
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods
  extend Concerns::Nameable

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.send("artist=", artist) if artist
    @genre = genre
    self.send("genre=", genre) if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    if !genre.songs.include?(self)
      genre.songs << self
    end
    @genre = genre
  end

  def self.all
    @@all
  end

  def self.new_from_filename(filename)
    array = filename.gsub(".mp3", "").split(" - ")
    artist = array[0]
    name = array[1]
    genre = array[2]

    song = Song.find_or_create_by_name(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end  
end
