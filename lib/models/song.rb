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
    self.send("genre=", genre) if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.new_from_filename(filename)
    array = filename.gsub(".mp3", "").split(" - ")
    artist_name, song_name, genre_name = array[0], array[1], array[2]

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).tap {|s| s.save}
  end  
end
