require 'pry'
require_relative '../lib/concerns/Findable.rb'
#require_relative '../lib/musicimporter.rb'
class Song
  extend Concerns::Findable
  @@all = []
  attr_accessor :name, :artist, :genre, :counter
  def initialize (name, artist = nil, genre = nil)
    @name = name#self.class.all << self
    if artist != nil #== true #evaluates to truthy, !=nil && !=false
      self.artist = artist
    end
    if genre != nil #== true
      self.genre = genre
    end
    #@counter = 0
  end

  def genre=(genre)
     @genre = genre
     if genre.songs.include?(self) == false
      genre.songs << self
     elsif genre.songs == nil
      genre.songs = self
     end
  end
  def artist=(beattle_instance)
    @artist = beattle_instance
    beattle_instance.add_song(self)
  end
  def self.all
      @@all
      #binding.pry
  end
  def self.destroy_all
      @@all = []
    end
  def save
      @@all<< self
  end
  def self.new_from_filename(file_name)
   split_file = file_name.split(" - ")
   artist_name = split_file[0]
   song_name = split_file[1]
   genre_name = split_file[2].gsub(".mp3", "")
   song = self.new(song_name)#it is a Song class object
   song.artist_name=(artist_name)#setter method artist_name to pass artist_name parameter into song object
   song.genre_name=(genre_name)#setter method artist_name to pass genre_name parameter into song object
   song
 end
 def artist_name=(artist)
   self.artist=(Artist.find_or_create_by_name(artist))
   #binding.pry
   self.artist.add_song(self)
 end
 def genre_name=(genre)
   self.genre=(Genre.find_or_create_by_name(genre))
   self.genre.name
 end
 def self.create_from_filename(filename)
     split_filename = (filename).split(" - ")
     artist_name = split_filename[0]
     song_name = split_filename[1]
     genre_name = split_filename[2].gsub(/.mp3/,"")
     song = self.new(song_name)
     song.artist_name=(artist_name)
     song.genre_name=(genre_name)
     song.save
     song
 end
end
