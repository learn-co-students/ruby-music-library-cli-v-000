class Song
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist= Artist.find_or_create_by_name(parts.first)
    genre= Genre.find_or_create_by_name(parts[2])
    song= self.create(parts[1])
    binding.pry
  end


  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.save
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre= (genre)
    @genre= genre
    genre.songs << self unless genre.songs.include?(self)
  end

end
