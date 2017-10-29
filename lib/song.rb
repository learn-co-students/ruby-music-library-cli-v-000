require "pry"
class Song
  extend Concerns::Findable
  extend Concerns::Createdestroy
  include Concerns::Save
  attr_accessor :name, :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name

    self.genre = genre if !genre.nil?
    self.artist = artist if !artist.nil? # <-- if there is an artist then create a class and add the artist
  end

  def self.all
    @@all
  end

  def self.new_from_filename(filename)
    file_parse = filename.gsub(".mp3","").split(" - ")
    name = file_parse[1]
    artist = Artist.new(file_parse[0])
    genre = Genre.new(file_parse[2])
    song = Song.new(name,artist,genre)
    artist = Artist.find_or_create_by_name(song.artist)
    genre = Genre.find_or_create_by_name(song.genre)

    return song
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      Song.find_by_name(name)
    else
      Song.create(name)
    end
  end

  def self.new_from_filename(filename)
    parsed_file = filename.split(' - ')
    artist = Artist.find_or_create_by_name(parsed_file[0])
    name = parsed_file[1]
    genre = Genre.find_or_create_by_name(parsed_file[2].gsub('.mp3', ''))
    new(name, artist, genre)
  end

  def self.create_from_filename(name)
    new_from_filename(name).tap do |f|
      f.save
    end
  end

  def save
    Song.all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

end
