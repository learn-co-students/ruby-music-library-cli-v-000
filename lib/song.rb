require 'pry'

class Song

attr_accessor :name
attr_reader :artist, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    #@genre = genre if genre

    self.artist = artist if artist
    self.genre = genre if genre
  end
#----- Genre methods-----
  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs.push self unless genre.songs.include? self
  end
#-----------

  def self.create(name) #Class method
    name = Song.new(name)
    name.save
    name
  end

  def self.all #class_method
    @@all
  end

  def self.destroy_all #class_method
    self.all.clear
  end

  def save #Instance_method
    @@all << self
  end

  def artist=(artist)
    @artist = artist if artist
     artist.add_song(self)
  end

  def self.new_from_filename(filename)

    parts = filename.split (" - ")# parses the filename
    artist_name = parts[0]# parses the filename
    song_name = parts[1]# parses the filename
    genre_name = parts[2].gsub(".mp3","")# parses the filename

    if find_by_name(song_name)#calls a method in the Module
    else
    artist_name = Artist.find_or_create_by_name(artist_name)
    genre_name = Genre.find_or_create_by_name(genre_name)
    new(song_name, artist_name, genre_name)
  end
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end
end
