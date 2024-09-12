class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre


  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    Song.all << self
  end

  def self.destroy_all
    self.all.clear
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
    file_array = filename.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(file_array[0])
    song = Song.find_or_create_by_name(file_array[1])
    genre = Genre.find_or_create_by_name(file_array[2])

    song.artist=(artist)
    song.genre=(genre)
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
  end

end
