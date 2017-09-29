require 'pry'
class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    if artist != nil
      self.artist = artist
    end
    if genre !=nil
      self.genre = genre
    end
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    filesub = filename.gsub!(".mp3", "")
    file = filesub.split(" - ")
    artist_name = file[0]
    name = file[1]
    artist_name=file[0]
    genre_name = file[2]
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.new(name, artist, genre)
    song
  end

  def self.create_from_filename(filename)
    filesub = filename.gsub!(".mp3", "")
    file = filesub.split(" - ")
    artist_name = file[0]
    name = file[1]
    artist_name=file[0]
    genre_name = file[2]
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.new(name, artist, genre)
    @@all << song
    song
  end

end



