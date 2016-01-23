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
    @@all << artist
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
    self.all.find do |song|
      song.name == name
    end
  end

  def self.create_by_name(name)
    self.new(name).tap {|song| song.save}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
    return name
  end

  def self.new_from_filename(file_name) 

    song_info = file_name.split(/ - |.mp3/)
    # song_info = file_name.split(".").delete_if{|q| q=="mp3"}.join.split(" - ")

    artist_info = Artist.find_or_create_by_name(song_info[0])
    genre_info = Genre.find_or_create_by_name(song_info[2])
    # song_name = Song.find_or_create_by_name(song_info[1])
    # Song is already being initialized, so writing it here will confuse the system
    self.new(song_info[1], artist_info, genre_info)
    
  end

  def self.create_from_filename(filename)
    x = new_from_filename(filename)
    x.save
    x
  end
  

end
















