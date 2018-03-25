require 'pry'

class Song
  # < Basics
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  #
  # def initialize(name, artist = "Unknown")
  def initialize(name, artist = nil, genre = nil)
    # binding.pry
    # super(name)
    @name = name
    # artist ? self : @artist = artist
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
  # #   # binding.pry
  # #   # if artist.class.name != "Artist"
  # #   #   Artist.new(artist).tap do |new_artist|
  # #   #     new_artist.add_song(self)
    # @artist = artist
    @artist = artist
    artist.add_song(self)
  # #   #   end
  # #   # else
  #     artist.add_song(self)
  # #     self[:artist] = artist
  # #   # end
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    # binding.pry
    artist, songname, genre = filename.split(" - ")
    Song.new(songname).tap do |song|
      song.artist = Artist.find_or_create_by_name(artist)
      song.genre = Genre.find_or_create_by_name(genre.gsub('.mp3', ''))
    end
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
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
    self.new(name).tap do |new_instance|
      @@all << new_instance
    end
  end
  # def self.find_by_name(name)
  #   all.find {|song| song.name == name}
  # end

  # def self.find_or_create_by_name(name)
  #   find_by_name(name) || create(name)
  # end
    # self.all(&:name).detect(name)

  # def self.all
  #   @@all
  # end
  #
  # def save
  #   @@all << self
  # end
  #
  # def self.destroy_all
  #   @@all.clear
  # end
  #
  # def self.create(name)
  #   self.new(name).tap do |new_instance|
  #     @@all << new_instance
  #   end
  # end
end
