class Song
  extend Concerns::Findable
  #include Findable::InstanceMethods

  @@all = []

  def self.all
    @@all
  end

  def self.create(name, artist = nil, genre = nil)
    new_object = self.new(name, artist, genre)
    new_object.save
    new_object
  end

  def self.create_from_filename(filename)
    new_object = self.new_from_filename(filename)
    new_object.save
    new_object
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(" - ")
    name = filename_array[1].strip
    artist = Artist.find_or_create_by_name(filename_array[0].strip)
    genre = Genre.find_or_create_by_name(filename_array[2][0..-5].strip)
    Song.new(name, artist, genre)
  end

  def self.destroy_all
    self.all.clear
  end

  attr_accessor :name
  attr_reader :artist, :genre

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def save
    self.class.all << self
  end

end
