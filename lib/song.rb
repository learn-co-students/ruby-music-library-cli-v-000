require 'pry'
class Song
  # inheritance
  extend Concerns::Findable

  # class variables
  @@all = []

  # attribute accessors
  attr_accessor :name
  attr_reader :artist, :genre

  # default and custom constructors
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def self.create(name, artist = nil, genre = nil)
    new_song = self.new(name, artist, genre)
    new_song.save
  end

  def self.new_from_filename(filename)
    new_file = filename.chomp('.mp3')
    new_file = new_file.split(' - ')
    artist = Artist.find_or_create_by_name(new_file[0])
    genre = Genre.find_or_create_by_name(new_file[2])
    new_song = Song.find_or_create_by_name(new_file[1])
    new_song.artist = artist
    new_song.genre = genre
    new_song
  end

  def self.create_from_filename(filename)
    new_song = Song.new_from_filename(filename)
    new_song.save
  end

  # class methods
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  # instance methods
  def save
    if !Song.all.include?(self)
      @@all << self
    end
    self
  end

  def artist=(artist)
    @artist = artist
    if artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if genre
       if !genre.songs.include?(self)
          genre.songs << self
       end
    end
  end
end
