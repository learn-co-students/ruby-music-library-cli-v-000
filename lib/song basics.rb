require_relative '../concerns/findable.rb'

class Song
	extend CONCERNS::FINDABLE
	
	attr_accessor :name
	attr_reader :artist, :genre
	@@all = []
	def initialize(name,artist=nil, genre=nil)
		@name =name
		if !artist.nil?
		self.artist=(artist)
		end
		if !genre.nil?
			@genre = genre
			if !genre.songs.include?(self)
				genre.songs << self
			end
		end
	end
	
	def genre=(genre)
		@genre = genre
		if !genre.songs.include?(self)
			genre.songs << self
		end
		@genre
	end
	
	def artist=(artist)
		@artist = artist
		artist.add_song(self)
	end
	
	def save
		@@all << self
	end
	
	def self.create(name)
		new_song = self.new(name)
		new_song.save
		new_song
	end
	
	def self.all
		@@all
	end
	
	def self.destroy_all
		@@all.clear
	end
	
	def self.new_from_filename(filename)
		artist_part = filename.split(" - ")[0]
		artist = Artist.create(artist_part)
		
		genre_part = filename.split(" - ")[2].gsub(/.mp3/,"")
		genre = Genre.create(genre)
		
		song = filename.split(" - ")[1]
		song = self.new(song,artist,genre)
		song
	end
	
end