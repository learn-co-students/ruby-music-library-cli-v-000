require_relative '../concerns/findable.rb'


class Genre
	extend Concerns::Findable
	
	attr_accessor :name
	@@all = []
	def initialize(name)
		@name =name
		@songs = []
	end
	
	def songs
		@songs
	end
	
	def artists
		artists = self.songs.collect { |x| x.artist }.uniq
		artists
	end
	
	def save
		@@all << self
	end
	
	def self.create(name)
		if self.all.detect { |x| x.name == name}.nil?
			new_genre = self.new(name)
			new_genre.save
			new_genre
		else
			self.all.detect { |x| x.name == name}
		end
	end
	
	def self.all
		@@all
	end
	
	def self.destroy_all
		@@all.clear
	end
	
	
end