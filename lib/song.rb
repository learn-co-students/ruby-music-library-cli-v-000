require 'pry'

class Song
  attr_accessor :name
  attr_reader :genre, :artist
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs.push(self) unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    self.new(name).tap {|song| song.save}
  end

  def self.find_by_name(name)
    self.all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    filename = filename.split(/(\s-\s)|(.mp3)/)
    artist, song, genre = filename[0], filename[2], filename[4]
    binding.pry
    # maybe make the arguments symbols so that I can pass them in without worrying about order?
    # need to make it so that the artist and genre aren't string objects
    # maybe a find_or_create by name and then add it to the song obj?
  end
end
