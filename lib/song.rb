class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist="", genre="")
    @name = name
    if artist != ""
      self.artist=(artist)
    end
    if genre != ""
      self.genre=(genre)
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    self.all << song
    song
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

  def self.new_from_filename(filename)
    filename_array = []
    filename_array = filename.split(/[-.]/)
    artist = Artist.find_or_create_by_name(filename_array[0].strip)
    genre = Genre.find_or_create_by_name(filename_array[2].strip)
    song = Song.new(filename_array[1].strip, artist, genre)
  end 

  def self.create_from_filename(filename)
    filename_array = []
    filename_array = filename.split(/[-.]/)
    song = Song.create(filename_array[1].strip)
    song.artist = Artist.find_or_create_by_name(filename_array[0].strip)
    song.genre = Genre.find_or_create_by_name(filename_array[2].strip)
    song
  end 

end