require "pry"
class Song

  attr_accessor :name
  attr_reader :artist, :genre


  @@all = []

  def artist= (artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def initialize(name, artist=nil, genre=nil)
    self.artist= artist if artist
    @name = name
    self.genre= genre if genre
  end


  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all.push(self)
  end

  def self.create(name)
    song = self.new(name, artist, genre)
    song.save
    song
  end

  def genre= (genre)
    @genre = genre
    self.genre.songs.push(self) if does_not_have(self)
  end

  def does_not_have(song)
    self.genre.songs.none? { |a_song| a_song.name == song.name}
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name,artist,genre)
    end
  end

  def self.new_from_filename(filename)
    name = filename.split(" - ")[1]
    artist = filename.split(" - ")[0]
    genre = filename.split(" - ")[2].split(".")[0]

    song = self.new(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.create_from_filename(filename)
    new = self.new_from_filename(filename)
    @@all.push(new)
    new
  end

end
