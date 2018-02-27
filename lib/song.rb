require_relative './findable.rb'
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
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
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  def self.new_from_filename(filename)
      each_song = filename.split(" - ")
      title = each_song[1]
      artist = Artist.find_or_create_by_name(each_song[0])
      genre_name = each_song[2].chomp(".mp3")
      genre = Genre.find_or_create_by_name(genre_name)
      song = Song.new(title,artist,genre)
  end
    def self.create_from_filename(filename)
      song = self.new_from_filename(filename)
      song.save
      song
    end

  def self.all
    @@all
  end
  def self.destroy_all
    self.all.clear
  end
  def save
    @@all << self
  end
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
end
