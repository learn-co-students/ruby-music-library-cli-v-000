require 'pry'

class Song

attr_accessor :name, :artist, :genre

 @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
   @artist = artist
   artist.songs(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
   @genre = genre
   genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all.uniq
  end

  def self.destroy_all
    @@all.clear
  end

  def save
   @@all << self
  end

  def self.create(name, artist=nil, genre=nil)
   new(name, artist, genre).tap{ |x| x.save }
  end

  def self.find_by_name(name)
    @@all.find {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(song_name) # Thundercat - For Love I Come - dance.mp3
   artist_name = song_name.split(" - ")[0]#Thundercat
   song_n = song_name.split(" - ")[1] #For Love I come
   genre_n = song_name.split(" - ")[2].gsub(".mp3","") #dance
   artist = Artist.find_or_create_by_name(artist_name)
   genre = Genre.find_or_create_by_name(genre_n)
   self.new(song_n, artist, genre)
  end

  def self.create_from_filename(song_name)
    artist_name = song_name.split(" - ")[0] #Thundercat
    song_n = song_name.split(" - ")[1] #For Love I come
    genre_n = song_name.split(" - ")[2].gsub(".mp3","") #dance
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_n)
    self.create(song_n, artist, genre)
  end

end
