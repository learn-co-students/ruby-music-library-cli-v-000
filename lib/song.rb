class Song
  extend Concerns::Findable
  # extend Concerns::Allable::ClassMethods
  # include Concerns::Allable::InstanceMethods
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre
    self.save
  end

  def artist=(artist)
    artist = Artist.find_or_create_by_name(artist) if artist.is_a?(String)
    @artist = artist if artist
    @artist.add_song(self) if artist
  end

  def genre=(genre)
    genre = Genre.find_or_create_by_name(genre) if genre.is_a?(String)
    @genre = genre if genre
    @genre.add_song(self) if genre
  end

  def self.new_from_filename(filename)
    split_path = filename.split(/ - |\./).collect{ |i| i.strip}
    song = Song.new(split_path[1], split_path[0], split_path[2])
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.all
    @@all.sort{|a, b| a.name <=> b.name}
  end

  def self.all=(array)
    @@all = array
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end
end
