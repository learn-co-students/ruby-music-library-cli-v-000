class Song
  extend Concerns::Findable
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

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
     parts = filename.split(" - ")
     artist_name = parts[0]
     song_name = parts[1]
     genre_name = parts[2].gsub(".mp3", "")

     song = self.new(song_name)
     song.artist = Artist.find_or_create_by_name(artist_name)
     song.genre = Genre.find_or_create_by_name(genre_name)
     song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end


end
