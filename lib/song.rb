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

  def self.create(name, artist = nil, genre = nil)
    song = Song.new(name, artist, genre)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    unless genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.new_from_filename(filename)
     parts = filename.split(" - ")
     artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")

     artist = Artist.find_or_create_by_name(artist_name)
     genre = Genre.find_or_create_by_name(genre_name)
     self.new(song_name, artist, genre)
   end

   def self.create_from_filename(filename)
     parts = filename.split(" - ")
     artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")

     artist = Artist.find_or_create_by_name(artist_name)
     genre = Genre.find_or_create_by_name(genre_name)
     self.create(song_name, artist, genre)
   end


end
