require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Song.new(name)
    self.all << song
    song
  end

  def artist=(artist_name)
    @artist = artist_name
    @artist.add_song(self)
  end

  def genre=(genre_name)
    @genre = genre_name
    #if #@genre.songs.include?(self)
        #@genre.songs.select{|song| song == self}
    #else
      @genre.songs << (self) if !@genre.songs.include?(self)
      #unless !genre.songs.include?(self)
  #end
end

  def self.find_by_name(name)
   @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    #binding.pry
   self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    song_info = filename.split(" - ")
    new_song = Song.find_or_create_by_name(song_info[1])
    new_song.artist = Artist.find_or_create_by_name(song_info[0])
    new_song.genre = Genre.find_or_create_by_name(song_info[2].gsub!(".mp3", ""))
    new_song
  end

  def self.create_from_filename(filename)
    song_info = filename.split(" - ")
    new_song = Song.find_or_create_by_name(song_info[1])
    new_song.artist = Artist.find_or_create_by_name(song_info[0])
    new_song.genre = Genre.find_or_create_by_name(song_info[2].gsub!(".mp3", ""))
    @@all << new_song
    new_song
  end

end
