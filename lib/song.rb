require_relative '../concerns/findable.rb'

class Song

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end

  def song=(song)
    @song = song
  end

  def artist=(artist)
    unless self.artist == artist
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    unless self.genre == genre
      @genre = genre
      genre.add_song(self)
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

  def self.create_from_filename(name)
    self.new_from_filename(name).save[0]
  end

  def self.new_from_filename(name)
   artist_name = name.split(" - ")[0]
   song_name = name.split(" - ")[1]
   genre_name = name.split(" - ")[2].chomp(".mp3")
   artist = Artist.find_or_create_by_name(artist_name)
   genre = Genre.find_or_create_by_name(genre_name)
   Song.new(song_name, artist, genre)
  end

end