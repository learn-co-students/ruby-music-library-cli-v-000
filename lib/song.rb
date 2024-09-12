require 'pry'
class Song

  attr_accessor :name
  attr_reader :artist, :genre

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
   @@all.clear
 end

 def save
   @@all << self
 end

 def self.create(name)
  name = Song.new(name)
  name.save
  name
 end

 def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  until genre.songs.include?(self)
    genre.songs << self
  end
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
    file_split = filename.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(file_split[0])
    genre = Genre.find_or_create_by_name(file_split[2])
    self.new(file_split[1], artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end 

  #end
#end

end
