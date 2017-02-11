require 'pry'
class Song
  attr_accessor :name, :artist, :genre
    extend Concerns::Findable
    @@all = []

  def initialize(name,artist=nil,genre=nil)
    @name = name
    @songs = []
    self.artist = artist if artist
    self.genre = genre if genre
    @@all << self

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
  self.new(song)
end

def artist=(art)
  @artist = art

@artist.add_song(self)
end

def genre=(gen)
  @genre = gen
  gen.songs << self unless gen.songs.include?(self)
end

def self.new_from_filename(file)
  split_file  = file.split(" - ")
  song_name   =  split_file[1]
  song_artist =  split_file[0]
  song_genre  =  split_file[2].gsub(".mp3","")
  artist = Artist.find_or_create_by_name(song_artist)
  genre = Genre.find_or_create_by_name(song_genre)
  song = Song.new(song_name,artist,genre)
  song
end

def self.create_from_filename(file)
  Song.new_from_filename(file)
end


end
