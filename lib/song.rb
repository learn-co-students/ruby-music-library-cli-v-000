require 'pry'
class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist!=nil
    self.artist = artist
    end
    if genre!=nil
      self.genre = genre
    end
  end

  def self.all
    @@all
  end


  def save
    @@all << self
    #binding.pry
  end

  def self.create(song)

      song = self.new(song)

      song.save
      song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_by_name(song_name)
    @@all.detect do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
     self.find_by_name(song_name) || self.create(song_name)
  end

  def self.new_from_filename(filename)

    artist_name = filename.split(" - ")[0].gsub(".mp3", "")
    song_name = filename.split(" - ")[1].gsub(".mp3", "")
    genre_name = filename.split(" - ")[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name) #object relationship plus this is not artist class
    genre = Genre.find_or_create_by_name(genre_name) #this is not class genre
    song = self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    #binding.pry
    artist_name = filename.split(" - ")[0].gsub(".mp3", "")
    song_name = filename.split(" - ")[1].gsub(".mp3", "")
    genre_name = filename.split(" - ")[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name) #object relationship plus this is not artist class
    genre = Genre.find_or_create_by_name(genre_name) #this is not class genre
    #binding.pry
    song = self.new(song_name, artist, genre)
    song.save
    song
  end

 def artist=(artist)
   @artist = artist
    artist.add_song(self)
 end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
end