class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre, :files
  #attr_reader :artist, :genre


  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name, artist = nil, genre = nil)
    @song = self.new(name)
    @song.artist = artist if artist
    @song.genre = genre if genre
    @song.save
    @song
  end

  def artist=(artist_name)
    @artist = artist_name
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.add_song(self)
  end

  def self.destroy_all
    self.all.clear
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  #def self.find_or_create_by_name(name)
    #if self.find_by_name(name)
      #self.find_by_name(name)
    #else
      #self.create(name)
    #end
  #end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_type = parts[0], parts[1], parts[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_type)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_type = parts[0], parts[1], parts[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_type)
    self.create(song_name, artist, genre)
  end


end
