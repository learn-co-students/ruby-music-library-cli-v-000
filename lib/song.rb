require 'pry'

class Song

  attr_accessor :name, :song, :genre, :artist

  extend Concerns::Findable
  include Concerns::Basics


  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @genre = genre
    @artist = artist
    
    if genre != nil
      genre.add_song(self)

    end
    if artist != nil
      artist.add_song(self)

    end


 
  end

  def self.all
    @@all
  end

 

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
    

  end

  def self.new_from_filename(file_name)
    split= file_name.gsub(".mp3","").split(" - ")
    song = self.new(split[1],Artist.find_or_create_by_name(split[0]),Genre.find_or_create_by_name(split[2]))
    #song.artist= Artist.find_or_create_by_name(file_name.split(" - ")[0])
    #song.genre = Genre.find_or_create_by_name(file_name.split(" - ")[2].gsub(".mp3",""))

    return song

  end

  def self.create_from_filename(file_name)
    split= file_name.gsub(".mp3","").split(" - ")
    song = self.new(split[1],Artist.find_or_create_by_name(split[0]),Genre.find_or_create_by_name(split[2]))
    song.save
    return song
  end


end