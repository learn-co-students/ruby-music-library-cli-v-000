class Song
  @@all = []
  include Concerns::Findable
  attr_accessor :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.create(name, artist = nil, genre = nil)
    song = new(name, artist, genre)
    song.save
    song
  end

  def self.new_from_filename(filename)
    name_of_artist = filename.split(' - ')[0]
    name_of_song = filename.split(' - ')[1]
    name_of_genre = filename.split(' - ')[2].gsub('.mp3','')

    artist = Artist.find_or_create_by_name(name_of_artist)
    genre = Genre.find_or_create_by_name(name_of_genre)
    song = self.new(name_of_song, artist, genre)
    song
  end

  def self.create_from_filename(filename)
    name_of_artist = filename.split(' - ')[0]
    name_of_song = filename.split(' - ')[1]
    name_of_genre = filename.split(' - ')[2].gsub('.mp3','')

    artist = Artist.find_or_create_by_name(name_of_artist)
    genre = Genre.find_or_create_by_name(name_of_genre)
    song = self.create(name_of_song, artist, genre)
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

end
