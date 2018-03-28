require 'pry'

  class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = "Musician", genre = "Generic")
    @name = name
    self.genre=(genre) if genre != "Generic"
    self.artist=(artist) if artist != "Musician"
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


  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if genre.songs.include?(self) == false
  end

  def self.create(name) #1/3
    Song.new(name).tap {|song| song.save}
  end

  def self.find_by_name(name) #2/3
    @@all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name) #3/3
    self.find_by_name(name) || self.create(name)
  end

  #clean it and create it: ("Lonely Artist - Sad Song - sadsongs.mp3")
  def self.new_from_filename(filename)
    artist_name = filename.split(" - ")[0] #LonelyArtist
    song_name = filename.split(" - ")[1] #Sad Song
    genre_name = filename.split(" - ")[2].gsub(".mp3", "") #sadsongs
    song = self.new(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(song)
    genre = Genre.find_or_create_by_name(genre_name)
    genre.add_song(song)
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

end
