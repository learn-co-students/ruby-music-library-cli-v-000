require 'pry'
class Song

  attr_accessor :name, :artist, :genre
  extend Concerns::Findable
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre

  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name, artist = nil, genre = nil)
    self.new(name, artist, genre).tap{|s| s.save}
  end

  # def self.create(name)        THIS DOES THE SAME AS SELF.CREATE ABOVE
  #   song = self.new(name)
  #   song.save
  #   song                    IT'S ALL ABOUT RETURN VALUES!!
  # end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(file)
    new_song_array = file.split(" - ")
    new_song = Song.new(new_song_array[1])
    new_song.artist = Artist.find_or_create_by_name(new_song_array[0])
    new_song.genre = Genre.find_or_create_by_name(new_song_array[2].chomp(".mp3"))
    new_song
  end

  def self.create_from_filename(file)
    new_from_filename(file).tap{|s| s.save}
  end

end
