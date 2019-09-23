require 'pry'
class Song


  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name=name
    self.artist=artist if artist
    self.genre=genre if genre
  end

  def genre
    @genre
  end

  def genre=(genre)
      @genre = genre
      genre.add_songs(self)
  end

  def artist=(artist)
    @artist = artist
    #artist.song = self
    artist.add_song(self)

  end

  def artist
    @artist
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

  def self.find_by_name(song)
    @@all.detect {|song1| song1.name == song }
  end

  def self.find_or_create_by_name(song)
    self.find_by_name(song) || self.create(song)
  end

  def self.new_from_filename(file)
    new_file = []
    new_file = file.split(" - ")

    artist1=new_file[0] #=> Thundercat
    name=new_file[1] #=> For Love I Come
    genre1=new_file[2].gsub(".mp3","") #=> dance

    artist2 = Artist.find_or_create_by_name(artist1)
    genre2 = Genre.find_or_create_by_name(genre1)
    song = self.new(name, artist2, genre2)
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
    song
  end


end #class
