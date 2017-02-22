
class Song

  extend Concerns::Findable
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    super
    if artist != nil
      self.artist = artist
      artist.add_song(self)
    end
    if genre != nil
      self.genre = genre
      genre.songs << self
    end
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.detect{|a| a == self}
      genre.songs << self
    end
  end

  def self.new_from_filename(filename)
    array = []
    array = filename.split(/\s\-\s|\.mp3/)
    song = self.new(array[1])
    song.artist = Artist.find_or_create_by_name(array[0])
    song.genre = Genre.find_or_create_by_name(array[2])
    song
  end

  def self.create_from_filename(filename)
    array = []
    array = filename.split(/\s\-\s|\.mp3/)
    song = self.create(array[1])
    song.artist = Artist.find_or_create_by_name(array[0])
    song.genre = Genre.find_or_create_by_name(array[2])
    song
  end
end
