require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name=name
    #binding.pry
    if artist != nil
      @artist=artist
      self.artist=artist
    end
    if genre != nil
      @genre=genre
      self.genre=genre
    end
    @@all<<self
  end

  def artist=(artist)
      @artist=artist
      artist.add_song(self)
  end

  def genre=(genre)
      @genre=genre
      if genre.songs.include?(self) == false
          genre.songs << self
      end
  end

  def self.find_by_name(name)
    if song = @@all.find {|song| song.name == name}
      song
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
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

  def self.create(name)
    Song.new(name)
  end

  def self.new_from_filename(filename)
    artist, song_name, genre = filename.split(" - ")
    new_song = self.create(song_name, artist, genre)
    new_song.artist = artist
    #new_song
  end
end
