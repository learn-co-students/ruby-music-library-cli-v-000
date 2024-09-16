class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = (artist) unless artist == nil
    self.genre = (genre) unless genre == nil
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    Song.all.clear
  end

  def save
    @@all << self
  end

  def self.create(song, artist=nil, genre=nil)
    songs = Song.new(song, artist, genre)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.find do |songs|
      songs.name == name
    end
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
   name = filename.split(" - ")[1]
   artist = filename.split(" - ")[0]
   genre = filename.split(" - ")[2].chomp(".mp3")
   song = self.find_or_create_by_name(name)
   song.artist = Artist.find_or_create_by_name(artist)
   song.genre = Genre.find_or_create_by_name(genre)
   song
  end

  def self.create_from_filename(song)
    new_from_filename(song)
  end
end
