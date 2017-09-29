require_relative "../lib/concerns/findable.rb"
class Song
	
	attr_accessor :name, :artist, :genre
	@@all = []
	
	extend Concerns::Findable
	
	def initialize(name, artist=nil, genre=nil)
		@name = name
		self.artist = artist
		self.genre = genre
	end
	
	def self.all
		@@all
	end
	
	def self.destroy_all
		@@all.clear
	end
	
	def self.create(name, artist=nil, genre=nil)
		song = Song.new(name, artist, genre)
		song.save
		song
	end
	
	def self.new_from_filename(filename)
		# formatted as "artist - title - .mp3"
		names = filename.split(" - ")
		artist = Artist.find_or_create_by_name(names[0])
		genre = Genre.find_or_create_by_name(names[2].gsub!(/.mp3/, ""))
		song = Song.new(names[1], artist, genre)
	end
	
	def self.create_from_filename(filename)
		names = filename.split(" - ")
		song = self.find_or_create_by_name(names[1])
		song.artist = Artist.find_or_create_by_name(names[0])
		song.genre = Genre.find_or_create_by_name(names[2].gsub!(/.mp3/, ""))
		song
	end
	
	def save
		self.class.all << self
	end
	
	def artist=(the_artist)
		if artist != the_artist
			@artist = the_artist
			artist.add_song(self)
		end
	end
	
	def genre=(genre)
		if @genre != genre
			@genre = genre
			genre.add_song(self)
		end
	end

	
end
	
	
	