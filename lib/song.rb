require 'pry'

class Song #belongs to an Artist and a Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :genre, :artist
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
    if genre !=nil && artist != nil
      artist.genres << self.genre
      genre.artists << self.artist
    end
  end

  def self.all
    @@all
  end

  def save #returns an array
    @@all << self unless @@all.detect {|song| song == self}
    self
  end

  def self.destroy_all
    @@all.clear
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    new_song = self.find_or_create_by_name(song_array[1])
    new_song.artist = Artist.find_or_create_by_name(song_array[0]) #creates new Song create with name
    new_song.genre = Genre.find_or_create_by_name(song_array[2].chomp(".mp3"))
    new_song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

end
