require_relative "../config/environment.rb"
#require_relative "./music_base.rb"
#require_relative "./Concerns::Findable.rb"

class Song #< Music
#  extend Music::C_Methods
#  include Music::I_Methods
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
      self.all.clear
  end

  def self.create(name)
    s = self.new(name)
    s
  end

  def save
    if self.class.all.include?(self)
      return nil
    end

    self.class.all << self
  end

  def self.find_by_name(name)
    arr = self.all
    rtn = arr.detect { |e| e.name == name}
    rtn
  end

  def self.find_or_create_by_name(name)
    rtn = self.find_by_name(name)
    if !!rtn
      return rtn
    else
      self.create(name)
    end
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.new_from_filename(filename)
    arr = filename.split(' - ')

    genre_name = arr[2].slice(0, (arr[2].length - 4)).strip
    artist_name = arr[0].strip
    song_name = arr[1].strip

    genre = Genre.find_or_create_by_name(genre_name)
    artist = Artist.find_or_create_by_name(artist_name)
    song = Song.new(song_name, artist, genre)
    song
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.genre = genre if !!genre
    self.artist = artist if !!artist
    save
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

end
