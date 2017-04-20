class Song

attr_accessor :name, :genre, :artist

extend Concerns::Findable

@@all = []

def initialize(name, artist = nil, genre = nil)
self.artist = artist if artist
@name = name
self.genre = genre if genre

end

def self.all
@@all
end

def save

@@all << self

end

def self.destroy_all
	self.all.clear
end

def self.create(song, artist = nil, genre = nil)
 self.new(song, artist, genre).tap {|s| s.save}

end

def artist=(artist)
	@artist = artist
	artist.add_song(self)
end

def genre=(genre)
	@genre = genre
genre.songs << self unless genre.songs.include?(self)
end

def self.new_from_filename(file)

shatter = file.split(" - ")
artist_name, song_title, genre = shatter.first, shatter[1], shatter[2].gsub(".mp3","")
artist = Artist.find_or_create_by_name(artist_name)
genre = Genre.find_or_create_by_name(genre)
self.new(song_title, artist, genre)

end

def self.create_from_filename(file)

shatter = file.split(" - ")
artist_name, song_title, genre = shatter.first, shatter[1], shatter[2].gsub(".mp3","")
artist = Artist.find_or_create_by_name(artist_name)
genre = Genre.find_or_create_by_name(genre)
self.create(song_title, artist, genre)
end

 def to_s
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
end

end
