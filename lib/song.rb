class Song
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil #If the song has an artist, it initializes the artist and connects the song and artist objects
    self.genre = genre if genre != nil #If the song has a genre, it initializes the genre and connects the genre and song objects
  end

  def self.new_from_filename(filename)
    song = find_or_create_by_name(filename.split(" - ")[1])
    song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].split(".")[0])
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    @@all
  end

  def artist=(artist)
    @artist = artist #creates artist instance variable
    @artist.add_song(self) #adds the song to the artist's collection and assigns the artist to the song
    @artist
  end

  def genre=(genre)
    @genre = genre #creates genre instance variable
    @genre.add_song(self) #adds the song to the genre's collection and assigns the genre to the song
    @genre
  end

  def self.all
    @@all
  end
end
