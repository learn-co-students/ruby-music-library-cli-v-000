class Song

	attr_accessor :name, :artist, :genre
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
		genre.add_song(self)
	end

	def self.find_by_name(name)
    	self.all.detect{|s| s.name == name}
  	end

	def self.find_or_create_by_name(name)
		self.find_by_name(name) || self.create(name)
	end

	def self.new_from_filename(filename)
		song_name = filename.split(" - ")[1]
		artist_name = filename.split(" - ")[0]
		genre_name = filename.split(" - ")[2].gsub(".mp3", "")
		artist = Artist.find_or_create_by_name(artist_name)
    	genre = Genre.find_or_create_by_name(genre_name)
    	self.new(song_name, artist, genre)
	end

	def self.create_from_filename(filename)
		song_name = filename.split(" - ")[1]
		artist_name = filename.split(" - ")[0]
		genre_name = filename.split(" - ")[2].gsub(".mp3", "")
		artist = Artist.find_or_create_by_name(artist_name)
    	genre = Genre.find_or_create_by_name(genre_name)
    	self.create(song_name, artist, genre)
	end

	def to_s
    	"#{self.artist.name} - #{self.name} - #{self.genre.name}"
  	end


end

# artist.songs << self

# rspec spec/001_song_basics_spec.rb
# rspec spec/004_songs_and_artists_spec.rb
# rspec spec/007_findable_songs_spec.rb




