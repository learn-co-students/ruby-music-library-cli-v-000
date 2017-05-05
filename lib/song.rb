class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    artist.nil? ? nil : artist.add_song(self)
    genre.nil? ? nil : genre.add_song(self)
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

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre if !@genre
    @genre.add_song(self)
  end

  def self.new_from_filename(file)
    file = file.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(file[0])
    song = Song.find_or_create_by_name(file[1])
    genre = Genre.find_or_create_by_name(file[2])
    song.artist = artist
    song.genre = genre
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song
  end

end
