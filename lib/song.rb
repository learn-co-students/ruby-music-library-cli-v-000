require 'pry'
class Song
  attr_accessor :name
  attr_reader :genre , :artist
  @@all = []
  def initialize(name, artist = nil, genre = nil) # the default input for artist and genre is nil(empty) upon initialization
    @name = name
    self.artist = artist  if artist # means I am invoking the song.artist = artist if the artist variable is not equal to nil
    self.genre = genre if genre # same here with the genre
  end
  def self.all
    @@all
  end
  def self.destroy_all
    self.all.clear
  end
  def save
    @@all << self # shavel the song in the all array
  end
  def self.create(name)
    name = Song.new(name)
    name.save
    name
  end
  def artist=(artist) # because i set the artist variable to a reader so i need a writter method (setter method)
    @artist = artist
    artist.add_song(self) # adding song to the artist list(collaborate with artist class)
  end
  def genre=(genre) # same here with genre
    @genre = genre
    genre.songs << self unless genre.songs.include?(self) #if the song is not in the songs array then shavel the song to the songs array
  end
  def self.find_by_name(name)
    #iterate over the all collection of songs and set song.name to be equal to the name argument
    all.find {|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    #invoke find by name if not true create a new one
    find_by_name(name) || create(name)
  end
  def self.new_from_filename(name)
    #spliting the artist, song and genre ( - )
    artist, song, genre_name = name.split(' - ')
    #chomp the .mp3 from the genre name
    fixed_name = genre_name.gsub('.mp3', '')
    #create new instance of artist using the property after splitting
    artist = Artist.find_or_create_by_name(artist)
    #create new genre instance using name after chomp the .mp3
    genre = Genre.find_or_create_by_name(fixed_name)
    #return the new names
    new(song, artist, genre)
  end
  def self.create_from_filename(name)
    new_from_filename(name).save    
  end
end
