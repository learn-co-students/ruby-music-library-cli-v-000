require_relative "../lib/concerns/findable.rb"
class Artist
	attr_accessor :name, :songs
	@@all = []
	
	extend Concerns::Findable
	
	def initialize(name)
		@name = name
		@songs = []
	end
	
	def self.all
		@@all
	end
	
	def self.destroy_all
		@@all.clear
	end
	
	def self.create(name)
		artist = Artist.new(name)
		artist.save
		artist
	end
	
	def save
		self.class.all << self
	end
	
	def add_song(song)
		if !songs.include?(song)
			@songs << song
			song.artist = self
		end
		self
	end
	
	def genres
		songs.collect {|song| song.genre}.uniq
	end
	
end