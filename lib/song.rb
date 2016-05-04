class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def add_artist(artist)
    @artist = artist
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.new_from_filename(file_name)
      song_array = file_name.split(" - ")
      artist = Artist.find_or_create_by_name(song_array[0])
      name = song_array[1]
      genre = Genre.find_or_create_by_name(song_array[2].gsub(".mp3", ""))
      self.new(name, artist, genre)
  end

  def self.create_from_filename(file_name)
    song = Song.new_from_filename(file_name)
    song.save
    song
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
end
