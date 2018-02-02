require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :genre, :artist
  # attr_reader
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil then self.artist=(artist) end
    if genre != nil then self.genre=(genre) end
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(info)
    song = Song.new(info)
    song.save
    song
  end

  def self.new_from_filename(filename)
    song_title = filename.split(" - ")[1]
    song_artist = filename.split(" - ")[0]
    genre = filename.split(" - ")[2].delete(".mp3")
    song = Song.new(song_title, Artist.find_or_create_by_name(song_artist), Genre.find_or_create_by_name(genre))
    # song.artist = song_artist
    #binding.pry
    song
  end

  def self.create_from_filename(file)
    song = Song.new_from_filename(file)
    song.save
  end

  def artist=(artist)
    #binding.pry
      @artist = artist
      artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  # def self.find_by_name(name)
  #   @@all.detect {|song| song.name == name}
  # end
  #
  # def self.find_or_create_by_name(name)
  #   if find_by_name(name)
  #     find_by_name(name)
  #   else
  #     create(name)
  #   end
  # end

end
