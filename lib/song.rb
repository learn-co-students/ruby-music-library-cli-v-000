class Song
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, artist=nil, genre=nil)
    self.name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.find_by_name(name)
    all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    result = find_by_name(name)
    result ? result : create(name)
  end

  def self.new_from_filename(filename)
    artist, name, genre = filename.split(' - ')
    song = self.new(
    name,
    Artist.find_or_create_by_name(artist),
    Genre.find_or_create_by_name(genre.split('.')[0])
    )
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song
  end
end
