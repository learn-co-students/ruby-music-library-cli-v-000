require_relative '../concerns/findable.rb'

class Song
	extend Concerns::Findable
	
	attr_accessor :name
	attr_reader :artist, :genre
	@@all = []
	def initialize(name,artist=nil, genre=nil)		
		if Song.all.detect{|x| x.name == name}.nil?
			@name =name
		else
			@name = self.all.detect{|x| x.name == name}
		end
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
	
	def self.create(name,artist=nil,genre=nil)
		new_song = self.new(name,artist,genre)
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
		artist = Artist.create(filename.split(" - ")[0])
		genre = Genre.create(filename.split(" - ")[2].gsub(/.mp3/,""))
		
		song_name = filename.split(" - ")[1]
		song = self.new(song_name,artist,genre)
		song
	end
	
	def self.create_from_filename(filename)	
		artist = Artist.create(filename.split(" - ")[0])
		genre = Genre.create(filename.split(" - ")[2].gsub(/.mp3/,""))
		
		song_name = filename.split(" - ")[1]
		song = self.create(song_name,artist,genre)
		song
	end
	
	
	
end