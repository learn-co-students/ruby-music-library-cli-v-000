require 'pry'

class Song
  extend Concerns::Findable
  @@all = []
  attr_accessor :name, :artist, :genre
  #attr_reader :artist

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist.is_a? Artist
      self.artist = artist
    end
    if genre.is_a? Genre
      self.genre = genre
    end
  end

  def save
    self.class.all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.new_from_filename(file)
    formatted = file.split(" - ")
    #binding.pry
    song = self.new(formatted[1])
    artist = Artist.find_or_create_by_name(formatted[0])
    genre = Genre.find_or_create_by_name(formatted[2].chomp(".mp3"))

    song.artist = artist
    song.genre = genre
    #binding.pry
    song
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end

  


  # def self.find_by_name(name)
  #   self.all.find{|song| song.name == name}
  # end
  #
  # def self.find_or_create_by_name(name)
  #   if self.find_by_name(name) == nil
  #     self.create(name)
  #   else
  #     self.find_by_name(name)
  #   end
  # end

end
