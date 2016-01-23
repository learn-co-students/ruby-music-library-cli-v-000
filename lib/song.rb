require_relative '../concerns/findable.rb'

class Song

  attr_accessor :name, :songs, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @songs = []
    self.artist = artist if artist 
    self.genre = genre if genre

  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
    # artist.songs << self
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
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

  def self.create(song_name)
    song = self.new(song_name)
    song.save
    song  
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.create_by_name(name)
    song = Song.new(name)
    song.name = name
    @@all << song
    song 
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : create_by_name(name)
  end

  def self.new_from_filename(file_name) 

    song_info = file_name.split(/ - |.mp3/)

    artist_info = Artist.find_or_create_by_name(song_info[0])
    genre_info = Genre.find_or_create_by_name(song_info[2])
    song_name = Song.find_or_create_by_name(song_info[1])
    self.new(song_name, artist_info, genre_info)
    
  end


  



  # def self.create_from_filename(file_name)
  #   song = self.new_from_filename(file_name)
  #   song.save
  #   song
  # end
  

end
















