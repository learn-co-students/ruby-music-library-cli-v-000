class Song
  attr_accessor :name
  attr_reader :artist, :genre

  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethod

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(name)
    @artist = name
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    split_filename = filename.split(" - ")
    song = Song.new(split_filename[1])
    song.artist = Artist.find_or_create_by_name(split_filename[0])
    song.genre = Genre.find_or_create_by_name(split_filename[2][0..-5])
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    @@all << song
  end

end
