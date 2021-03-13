require 'pry'

class Song
  extend Concerns::Findable
  
  @@all = []
  attr_accessor :name, :genre
  attr_reader :artist

  def initialize(name, artist = nil, genre = nil)
    @name = name
    #self.artist = artist if artist #Q&A video refactor
    if artist != nil
      self.artist = artist
    end
    #self.artist = artist if artist #Q&A video refactor
    if genre != nil
      self.genre = genre
    end
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
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
  
  def self.create(name, artist = nil, genre = nil)
    #new.(name).tap{|a| a.save} #Q&A video refactor
    song = Song.new(name, artist, genre)
    song.save
    song
  end
  
  def self.new_from_filename(file)
    song_name = file.split(/(\s-\s|\.)/)[2]
    song_artist = file.split(/(\s-\s|\.)/)[0]
    song_genre = file.split(/(\s-\s|\.)/)[4]
    song_artist_instance = Artist.find_or_create_by_name(song_artist)
    song_genre_instance = Genre.find_or_create_by_name(song_genre)
    song = self.new(song_name, song_artist_instance, song_genre_instance)
    song
  end
  
  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end
end