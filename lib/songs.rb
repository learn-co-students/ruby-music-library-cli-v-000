class Song
  extend Concerns::Findable #Take all of the methods in the findable module and add them as class methods
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

  attr_accessor :name, :artist, :genre
  @@all = []

  def self.all #Class Reader
    @@all
  end

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    self.artist = artist if artist != nil
    @genre = genre
    self.genre = genre if genre !=nil
  end


def artist=(artist)
  @artist=artist
  self.artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  self.genre.songs << self unless genre.songs.include?(self)
end

def self.create_from_filename(filename)
  self.new_from_filename(filename).save
end


def self.destroy_all
  @@all = []
end

def save
  @@all << self
  self
end

def self.create(name)
  song = Song.new(name)
  song.save
  song
end


def self.find_by_name(name)
  self.all.detect do |song|
    song.name == name
end
end

def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create(name)
end

def self.new_from_filename(filename)
  filename_array = filename.split(" - ")

  song_artist = Artist.find_or_create_by_name(filename_array[0])
  song_genre = Genre.find_or_create_by_name(filename_array[2].split(".mp3")[0])
  song = Song.new(filename_array[1], song_artist, song_genre)

end




end
