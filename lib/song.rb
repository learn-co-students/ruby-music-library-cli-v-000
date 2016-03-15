require 'pry'

class Song

  @@all = []

  attr_accessor :name, :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
              
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) #if !artist.songs.include?(self)
  end

  def artist
    @artist
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end 

  def genre
    @genre
  end

  def self.find_by_name(song)
    @song = song
    @@all.each {|song| return song if song.name == @song }
  end

  def self.find_or_create_by_name(song)
    @song = song
    find = self.find_by_name(@song)
    self.create(@song) if find.nil?
  end

 def self.new_from_filename(filename)
    filename = filename.chomp(".mp3").split(" - ")
    file_artist = Artist.find_or_create_by_name(filename[0])
    file_genre = Genre.find_or_create_by_name(filename[2])
    # binding.pry
    song = self.new(filename[1], file_artist, file_genre)
  end

  def self.create_from_filename(filename)
    filename = filename.chomp(".mp3").split(" - ")
    file_artist = Artist.find_or_create_by_name(filename[0])
    file_genre = Genre.find_or_create_by_name(filename[2])

    new_song = self.create(filename[1])
    new_song.artist = file_artist
    new_song.genre = file_genre
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    @song = self.new(name)
    @song.save
    @song
  end

end
