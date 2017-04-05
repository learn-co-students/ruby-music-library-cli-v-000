class Song
  attr_accessor :name, :artist
  attr_reader :genre
  extend Concerns::Findable
  @@all=[]

  def initialize(name,artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
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

  def self.create(name,artist=nil, genre=nil)
    new_song=self.new(name,artist,genre)
    new_song.save
    new_song
  end

  def genre=(genre)
    @genre=genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def self.new_from_filename(file_name)
    artist_name, song_name, genre_name = file_name.match(/(.+) - (.+) - (.+).mp3/).captures
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new(song_name, artist, genre)
  end

  def self.create_from_filename(file_name)
    artist_name, song_name, genre_name = file_name.match(/(.+) - (.+) - (.+).mp3/).captures
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)
  end
end
