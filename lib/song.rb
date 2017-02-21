require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all=[]

  def initialize(name, artist=nil, genre=nil)
    @name=name
    self.artist = artist if artist
    self.genre = genre if genre
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

  def self.create(name, artist=nil, genre=nil)
    new(name, artist, genre).tap {|a| a.save}
  end

  def artist_name
    self.artist.name
  end

  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre=genre
    genre.add_song(self)

  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub("mp3","").gsub(".",'')
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    #filename => "Thundercat - For Love I Come - dance.mp3"
    array = filename.split(" - ")
    artist_name = array[0] #Thundercat
    artist = Artist.find_or_create_by_name(artist_name)
    song = array[1] #For Love I Come
    genre_name = (array[2].chomp(".mp3")) #dance
    genre = Genre.find_or_create_by_name(genre_name)
    new_song = Song.new(song, artist, genre)
    @@all<<new_song   #adds new song to @@all
    new_song          #return new song
  end

  def self.list_songs
    puts "#{artist_name} - #{song} - #{genre_name}"
  end

  def list_artists
    puts "#{artist_name}"
  end

  def list_genres
    puts "#{genre_name}"
  end

  def play_song

  end

  def list_artist_songs
    puts "#{artist.songs}"
  end

  def list_genre_songs
    puts "#{genre.songs}"
  end



end
