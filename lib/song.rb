class Song
extend Concerns::Findable

attr_accessor :name, :genre
attr_reader :artist

@@all = [ ]

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
	genre.add_song(self)
end


def self.all
	@@all
end

def self.destroy_all
	@@all = [ ]
end

def save
	@@all << self
end

def self.create(name)
	s = Song.new(name)
	s.save
	s
end



 def self.find_or_create_by_name(name)
 	find_by_name(name) || create(name)
 end

 def self.new_from_filename(filename)
    song_name = (filename.split(" - ")[1])
    artist_name = (filename.split(" - ")[0])
    genre_name = (filename.split(" - ")[2]).gsub(".mp3", "")

    artist= Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre) unless self.find_by_name(song_name)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end


end
