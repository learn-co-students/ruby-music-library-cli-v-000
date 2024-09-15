require "pry"

class Song 
  extend Concerns::Findable
  
  attr_accessor :name, :artist
  attr_reader :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def artist=(artist)
   @artist = artist
     artist.add_song(self)
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
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
  
  def self.new_from_filename(filename)
    name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    artist = Artist.find_or_create_by_name(artist_name)
    genre_name = filename.split(" - ")[2].gsub(".mp3", "")
    genre = Genre.find_or_create_by_name(genre_name)
    # binding.pry
    song = self.new(name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end