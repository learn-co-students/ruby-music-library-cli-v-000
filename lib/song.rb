require_relative 'concerns/findable.rb'

class Song

  extend Concerns::Findable 
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name

    if artist
      self.artist = artist
    end

     if genre
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

  def self.create(song)
    new_song = Song.new(song)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self)
      genre.songs.find(self)
    else
      genre.songs << self
    end
  end

  def self.new_from_filename(filename)
    split_file = filename.split(/\A(.+)\s-\s(.+)\s-\s(.+).mp3\z/)
    artist = Artist.find_or_create_by_name(split_file[1])
    genre = Genre.find_or_create_by_name(split_file[3])
    Song.new(split_file[2], artist, genre)
  end

  def self.create_from_filename(filename)
    split_file = filename.split(/\A(.+)\s-\s(.+)\s-\s(.+).mp3\z/)
    artist = Artist.find_or_create_by_name(split_file[1])
    genre = Genre.find_or_create_by_name(split_file[3])
    new_song = Song.new(split_file[2], artist, genre)
    new_song.save
    new_song
  end

end