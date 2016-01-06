class Artist
	attr_accessor :name
	@@all = []
	def initialize(name)
		@name =name
	end
	
	def save
		@@all << self
	end
	
	def self.create(name)
		new_artist = self.new(name)
		new_artist.save
		new_artist
	end
	
	def self.all
		@@all
	end
	
	def self.destroy_all
		@@all.clear
	end
	
end