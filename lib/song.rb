require_relative '../concerns/findable.rb'

class Song
  extend Concerns::Findable
  include Concerns::InstanceMethods
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist
      self.artist = artist
    end
    if genre
      self.genre = genre
    end
  end

  def to_s
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def artist= (artist)
    @artist = artist
    if !artist.song_titles.include?(self.name)
      artist.add_song(self)
    end
  end

  def genre= (genre)
    @genre = genre
    if !genre.song_titles.include?(self.name)
      genre.songs << self
    end
  end

  def self.new_from_filename(file)
    artist, name, genre = file.split(" - ")
    genre.chomp!(".mp3")
    new_a = Artist.find_or_create_by_name(artist)
    new_g = Genre.find_or_create_by_name(genre)
    song = self.new(name, new_a, new_g)
    song
  end

  def self.create_from_filename(file)
    artist, name, genre = file.split(" - ")
    genre.chomp!(".mp3")
    new_a = Artist.find_or_create_by_name(artist)
    new_g = Genre.find_or_create_by_name(genre)
    song = self.create(name)
    song.artist = new_a
    song.genre = new_g
    song
  end

end