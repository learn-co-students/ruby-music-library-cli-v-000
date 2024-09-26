require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  #attr_reader :artist
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name=name
    self.artist=artist if artist != nil
    self.genre = genre if genre !=nil
    self.save
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def artist= (artist)
    @artist=artist
    artist.add_song(self)
  end
  
  def genre= (genre)
    @genre = genre
    genre.add_song(self) if !genre.songs.include?(self)
  end
  
  def self.create(name)
    song = Song.new(name)
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    song = Song.new(name)
  end
  
  def self.new_from_filename(filename)
    artist_file, song_file, genre_file = filename.split(" - ") #can assign to more than 1 like this
    artist = Artist.find_or_create_by_name(artist_file)
    genre = Genre.find_or_create_by_name(genre_file.chomp(".mp3"))
    song = Song.new(song_file, artist, genre)
    #binding.pry
  end
  
  def self.create_from_filename(filename)
    #artist_file, song_file, genre_file = filename.split(" - ") #can assign to more than 1 like this
    #artist = Artist.create(artist_file)
    #genre = Genre.create(genre_file.chomp".mp3")
    #song = Song.new(song_file, artist, genre)
    self.new_from_filename(filename)
  end
  
end

  #def self.find_by_name(name)
  #  self.all.find {|song| song.name == name}
  #end
  
  #def self.find_or_create_by_name(name)
  #  if self.find_by_name(name)
  #    self.find_by_name(name)
  #  else
  #    self.create(name)
  #  end
  #end