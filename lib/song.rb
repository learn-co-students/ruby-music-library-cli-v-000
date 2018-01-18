class Song

  attr_accessor :name, :artist, :genre

  @@all = [] # holds all of the songs created

  # INSTANCE METHODS
  def initialize(song_name, song_artist = nil, song_genre = nil)
    @name = song_name
    song_artist != nil ? self.artist=(song_artist) : return
    song_genre != nil ? self.genre=(song_genre) : return
  end

  def save
   @@all << self
  end

  def artist=(song_artist)
    @artist = song_artist
    song_artist.add_song(self)
  end

  def genre=(song_genre)
    @genre = song_genre
    song_genre.add_song(self)
  end

  # CLASS METHODS
  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def self.new_from_filename(filename)
    file_parts = filename.split(" - ")

    new_artist = Artist.find_or_create_by_name(file_parts[0])
    new_genre = Genre.find_or_create_by_name(file_parts[2].chomp(".mp3"))

    new_song = Song.new(file_parts[1], new_artist, new_genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    Song.all.clear
    puts @@all
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    result = Song.find_by_name(name)
    result != nil ? result : Song.create(name)
  end
end