require "pry"
class Song


  @@all = []

  attr_accessor :name, :artist, :genre

  def initialize(name, artist_object = nil, genre_object = nil)
    @name = name
    if artist_object
      self.artist = artist_object
    end
    if genre_object
      self.genre = genre_object
    end
  end

  def artist=(artist_object)
    @artist =  artist_object
    # @artist = Artist.find_or_create_by_name(artist_name)
    self.artist.add_song(self)
  end
  def artist
    @artist
  end

  def genre=(genre_object)
    @genre = genre_object
    # genre_name =  genre_object.name
    # @genre = Genre.find_or_create_by_name(genre_name)
    if !self.genre.songs.include?(self)
      self.genre.songs << self
    end
  end

  def genre
    @genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    created_song = self.new(name)
    created_song.save
    created_song
    # binding.pry
  end

  def self.find_by_name(name)
    @@all.detect {|i| i.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(filename)
    new_file = filename.slice(0..-5)
    song_name = new_file.split(" - ")[1]
    artist_name = new_file.split(" - ")[0]
    song = Song.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    genre_name = new_file.split(" - ")[2]
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  # def artist_name=(name)
  #   self.artist = Artist.find_or_create_by_name(name)
  #   self.artist.add_song(self)
  # end
end
