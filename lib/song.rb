class Song
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

  attr_accessor :name, :filename
  attr_reader :artist, :genre

  def self.all
    @@all
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self) #collaborates with Genre class
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) #collaborates with Artist class
  end

  def self.create(name, artist = nil, genre = nil)
    self.new(name, artist, genre).tap {|o| o.save}
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    artist_name = array[0]
    song_name = array[1]
    genre_name = array[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end
