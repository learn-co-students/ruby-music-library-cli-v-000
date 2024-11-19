require 'pry'
class Song


  attr_accessor :name
  attr_reader :artist
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include? self
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
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(name)
    split_filename = name.split(" - ")
    song = self.new(split_filename[1])
    genre_split = split_filename[2].chomp('.mp3')
    artist = Artist.find_or_create_by_name(split_filename[0])
    genre = Genre.find_or_create_by_name(genre_split)
    song.artist = artist
    song.genre = genre
    artist.add_song(song)
    song

    #binding.pry
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end



end
