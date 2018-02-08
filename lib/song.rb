require 'pry'
class Song

  attr_accessor :name
  attr_reader :artist, :genre
  @@all= []
  def initialize(name, artist=nil, genre=nil)
    @name=name
    self.artist= artist if artist
    self.genre= genre if genre
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all= []
  end
  def save
    @@all << self
    self
  end
  def self.create(name)
    song= new(name)
    song.save
  end
  def artist=(artist)
    @artist= artist
    artist.add_song(self)
  end
  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
    @genre.songs << self if !@genre.songs.include?(self)
  end
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
  def self.new_from_filename(filename)

    parts= filename.gsub(".mp3","").split(" - ")
    artist= Artist.find_or_create_by_name(parts[0])
    genre= Genre.find_or_create_by_name(parts[2])
    song= Song.new(parts[1],artist,genre)
    song.artist= artist
    song.genre= genre
    song
  end
#   def self.new_by_filename(filename)
#   file_name= filename.gsub(".mp3", "")
#
#   song_name = file_name.split(" - ")[1]
#   name_artist= file_name.split(" - ")[0]
#   song= Song.new(song_name)
#   artist= Artist.find_or_create_by_name(name_artist)
#   song.artist= artist
# <<<<<<< HEAD
#   artist.songs << song
# =======
# >>>>>>> c64b93a2e76c9d26ba6581ab2b8dad800c0b694a
#   song
# end
  def self.create_from_filename(filename)
    song= new_from_filename(filename)
    song.save
  end
end
