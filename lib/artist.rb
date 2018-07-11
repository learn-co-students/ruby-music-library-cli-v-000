class Artist 
	attr_accessor :name 

	@@all = []

	def initialize(name) 
		@name = name 
		@songs = []
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

	def self.create(name) 
		Artist.new(name).save 
	end  

	def songs 
		@songs
	end 

	def add_song(song) 
		@songs << song unless @songs.include?(song)
    	song.artist = self 
    end 
end 