require 'pry'
class Song

   attr_accessor :name, :artist, :genre
  @@all = []


  def initialize(name, artist = nil, genre = nil)
  @name = name
  @@all = []
  self.artist = artist if artist
  self.genre = genre if genre
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

  def self.create(name, artist = nil, genre = nil)
   song = self.new(name, artist, genre)

   song.save
   song
  end

 def artist=(artist)
   @artist = artist
   artist.add_song(self)
 end

 def genre=(genre)
   @genre = genre
  genre.songs << self unless genre.songs.include?(self)
 end

def self.find_by_name(name)
  self.all.find{|s| s.name == name}

end

def self.find_or_create_by_name(nname)
self.find_by_name(name) || self.create(name)
end

def self.new_from_filename(filename)
  splits = filename.chomp(".mp3").split(" - ")
  artist = Artist.find_or_create_by_name(splits[0])
  genre = Genre.find_or_create_by_name(splits[2])
  self.new(splits[1], artist, genre)
end

def self.create_from_filename(filename)
song = self.new_from_filename(filename)
song.save
song


end




end
