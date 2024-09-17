class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def save
    @@all << self
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=artist if artist != nil
    self.genre=genre if genre != nil
    self.save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(song)
    self.new(song)
  end

  def artist=(artist_instance)
    @artist = artist_instance
    artist_instance.add_song(self)
  end

  def genre=(genre_instance)
    @genre = genre_instance
    genre_instance.add_song(self)
  end

  def self.find_by_name(name)
    @@all.detect{|i| i.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else  self.create(name)
    end
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(/\s-\s/)
    genre_array = filename_array[2]
    genre_name = genre_array.split(".")
      song = self.find_or_create_by_name(filename_array[1])
      artist = Artist.find_or_create_by_name(filename_array[0])
      genre = Genre.find_or_create_by_name(genre_name[0])
      song.artist = artist
      song.genre = genre
      song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

end
