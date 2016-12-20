require 'pry'
class Song
  extend Concerns::Findable
@@all = []

  attr_accessor :artist, :name, :genre

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre 
  end

  def name=(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
    # binding.pry
# binding.pry 
  end

  def self.new_from_filename(file_name)
    data = file_name.chomp!('.mp3').split(' - ')
    new_song = Song.new(data[1])
    new_song.artist = Artist.find_or_create_by_name(data[0])
    new_song.genre = Genre.find_or_create_by_name(data[2])
    new_song
  end

  def self.create_from_filename(file_name)
    data = file_name.chomp!('.mp3').split(' - ')
    new_song = Song.new(data[1])
    new_song.artist = Artist.find_or_create_by_name(data[0])
    new_song.genre = Genre.find_or_create_by_name(data[2])
    new_song.save
    new_song
  end

end