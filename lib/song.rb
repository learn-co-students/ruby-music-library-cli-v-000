require 'pry'
require_relative '../concerns/findable.rb'
require_relative '../concerns/nameable.rb'
require_relative '../concerns/persistable.rb'

class Song
  extend Concerns::Findable
  # include Persistable::InstanceMethods
  # extend Persistable::ClassMethods
  # extend Nameable::ClassMethods

  attr_accessor :name, :artist, :genre


  @@all = []

  def initialize(name,artist = nil,genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
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
    song = Song.new(name)
    song.save
    song
  end

  def artist
    @artist
    # binding.pry
  end

  def artist=(art)
    @artist = art
    @artist.add_song(self)
    # binding.pry
    @artist
  end

  def genre
    @genre
    # binding.pry
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
    # binding.pry
    @genre
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if(song == nil)
      song = Song.create(name)
    end
    song
  end

  def self.new_from_filename(filename)
    if filename == nil
      return nil
    end
    art = filename
    art = art.gsub(/ - .{1,}/,'')
    artist = Artist.find_or_create_by_name(art)
    songname = filename.match(/ - [a-zA-Z\'\s]{1,40} - /).to_a[0]
    songname = songname.gsub(/ - /,'')
    genre = filename.gsub(/.{1,} - |.mp3/,'')
    gen = Genre.find_or_create_by_name(genre)
    song = Song.new(songname,artist,gen)
    song
    # binding.pry
  end

  def self.create_from_filename(filename)
    # song = self.new_from_filename(filename)
    art = filename
    art = art.gsub(/ - .{1,}/,'')
    artist = Artist.find_or_create_by_name(art)
    songname = filename.match(/ - [a-zA-Z\'\s]{1,40} - /).to_a[0]
    songname = songname.gsub(/ - /,'')
    genre = filename.gsub(/.{1,} - |.mp3/,'')
    gen = Genre.find_or_create_by_name(genre)
    song = Song.new(songname,artist,gen)
    @@all << song
    song 
  end
end