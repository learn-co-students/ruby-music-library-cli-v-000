require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist_obj=nil, genre_obj=nil)
    @name = name
    self.artist = artist_obj unless artist_obj == nil
    self.genre = genre_obj unless genre_obj == nil
  end

  def save
    self.class.all << self
  end

  def artist=(artist_obj)
    @artist = artist_obj
    artist_obj.add_song(self)
  end

  def genre=(genre_obj)
    @genre = genre_obj
    genre_obj.songs << self unless genre_obj.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    unless self.find_by_name(name)
      self.create(name)
    else self.find_by_name(name)
    end
  end

  def self.new_from_filename(file_name)
    song_info_arr = file_name.split(" - ")
    new_song = Song.find_or_create_by_name(song_info_arr[1])
    new_song.artist = Artist.find_or_create_by_name(song_info_arr[0])
    new_song.genre = Genre.find_or_create_by_name(song_info_arr[2].gsub(/.mp3/,""))
    new_song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)#.save
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

end
