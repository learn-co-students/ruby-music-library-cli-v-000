require 'pry'
class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist= nil, genre= nil)
    @name = name
    if artist != nil
      self.artist=artist
    end
    if genre != nil
      self.genre=genre
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
    #binding.pry
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self)
      self
    else
      genre.songs << self
    end
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song != nil
      song
    else
      self.create(name)
    end
  end

  def self.new_from_filename(file)
    #binding.pry
    new_song = file.split(" - ")
    # song = Song.new(new_song[1])
    artist = Artist.find_or_create_by_name(new_song[0])
    genre = Genre.find_or_create_by_name(new_song[2].gsub(".mp3", ""))
    Song.new(new_song[1], artist, genre)
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  end

end
