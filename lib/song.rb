require 'pry'
class Song
  extend Concerns::Findable
  extend Persistable::ClassMethods
  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
  attr_accessor :name

  @@all = []

  def initialize(name, singer = nil, genre = nil)
    @name = name
    self.artist=(singer) if singer
    self.genre=(genre) if genre
  end

  def artist
    @artist
  end

  def artist=(singer)
    @artist = singer
    @artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

  def self.all
    @@all
  end

  def self.new_from_filename(filename)
    array = filename.split(' - ')

    singer = array[0]
    title = array[1]
    type = array[2].chomp(".mp3")

    #tap it up when you get the chance
    song = self.find_or_create_by_name(title)
    song.artist = Artist.find_or_create_by_name(singer)
    song.genre= Genre.find_or_create_by_name(type)
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

end
