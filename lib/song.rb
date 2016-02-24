require_relative '../concerns/concerns.rb'
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
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
    artist
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
    genre
  end

  def self.new_from_filename(file)
    array = file.split(" - ")
    array[2].slice!(".mp3")
    song = self.new(array[1])
    song.artist = Artist.find_or_create_by_name(array[0])
    song.genre = Genre.find_or_create_by_name(array[2])
    song
  end

  def self.create_from_filename(file)
    array = file.split(" - ")
    array[2].slice!(".mp3")
    song = self.create(array[1])
    song.artist = Artist.find_or_create_by_name(array[0])
    song.genre = Genre.find_or_create_by_name(array[2])
    song
  end

  def name_without_mp3
    "#{@artist.name} - #{@name} - #{@genre.name}"
  end

end

