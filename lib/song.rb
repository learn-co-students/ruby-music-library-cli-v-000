require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    save
    self.artist = artist
    if genre.nil? == false 
      self.genre=(genre)
    end
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def artist=(artist)
    @artist = artist
    if artist 
      artist.add_song(self)
    end
  end

    def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    name = Song.new(name)
  end

   def self.new_from_filename(file_name)
    array = file_name.gsub(".mp3", "").split(' - ')
    song = find_or_create_by_name(array[1])
    artist = Artist.find_or_create_by_name(array[0])
    song.artist = artist
    genre = Genre.find_or_create_by_name(array[2])
    song.genre = genre
    song
  end

  def self.create_from_filename(file_name)
    new_from_filename(file_name)
  end
end

