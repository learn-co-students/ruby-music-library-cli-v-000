class Song
extend Concerns::Findable

attr_accessor :name, :genre
attr_reader :artist


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

def details
    "#{@artist.name} - #{@name} - #{@genre.name}"
  end

def self.create(name)
 song = Song.new(name)
 song.save
 song
end

def artist=(artist)
  @artist = artist
  @artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  @genre.songs << self unless @genre.songs.include?(self)
end

def self.new_from_filename(filename)
  file = filename.split(" - ")
  song = Song.new(file[1])
  song.artist = Artist.find_or_create_by_name(file[0])
  song.genre = Genre.find_or_create_by_name(file[2].split(".")[0])
  song
end

def self.create_from_filename(filename)
  song = self.new_from_filename(filename)
  song.save
  song
end

end