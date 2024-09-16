require 'pry'




class Song

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end

  end

  def artist=(artist)
    @artist = artist
    artist.songs << self
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    self.new(name).tap {|song| song.save}
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(/\s-\s|\.mp3/)
    file_artist = filename_array[0]
    file_song = filename_array[1]
    file_genre = filename_array[2]
    new_song = self.find_or_create_by_name(file_song)
    new_song.artist = Artist.find_or_create_by_name(file_artist)
    new_song.genre = Genre.find_or_create_by_name(file_genre)
    new_song
  end

  def self.create_from_filename(filename)
    filename_array = filename.split(/\s-\s|\.mp3/)
    file_artist = filename_array[0]
    file_song = filename_array[1]
    file_genre = filename_array[2]

    new_song = Song.new(file_song)
    new_song.artist = Artist.find_or_create_by_name(file_artist)
    new_song.genre = Genre.find_or_create_by_name(file_genre)
    new_song.save
    new_song
  end

end


