require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def genre=(genre)
    @genre = genre
    # im going to try something here to see if add_song is the issue
    genre.songs << self unless genre.songs.include?(self)
    #@genre.add_song(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end

  #this should probably have the same arguments s initialize
  def self.create(name, artist = nil, genre = nil)
    #tap makes it easy to do on one line :D
    new(name, artist, genre).tap{ |s| s.save}
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(filename)
    file_name_split = filename.gsub(/.mp3/, "").split(" - ")
    song_name = file_name_split[1]
    artist_name = file_name_split[0]
    genre_name = file_name_split[2]
    new_song = self.new(song_name)
    new_song.artist_name = artist_name
    new_song.genre_name = genre_name
    new_song
  end

  def self.create_from_filename(filename)
    file_name_split = filename.gsub(/.mp3/, "").split(" - ")
    song_name = file_name_split[1]
    artist_name = file_name_split[0]
    genre_name = file_name_split[2]
    new_song = self.create(song_name)
    new_song.artist_name = artist_name
    new_song.genre_name = genre_name
    new_song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by_name(name)
    genre.add_song(self)
  end

end
