class Song
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  extend Concerns::Nameable::ClassMethods
  include Concerns::Persistable::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(file_name)
    array = file_name.split(" - ")
    artist_name = array[0]
    title = array[1]
    genre_name = (array[2].chomp(".mp3"))

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new_song = Song.new(title, artist, genre)
  end

  def self.create_from_filename(file_name)
   new_from_filename(file_name).tap{ |o| o.save }
  end

end
