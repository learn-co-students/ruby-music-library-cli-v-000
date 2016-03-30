require_relative '../concerns/findable.rb'

class Artist
	extend Concerns::Findable
	
	attr_accessor :name
	@@all = []
	def initialize(name)
		
		@name =name
		@songs = []
	end
	
	def genres
		genres_array = self.songs.collect { |x| x.genre }.uniq
		genres_array
	end
	
	def save
		@@all << self
	end
	
	def songs
		@songs
	end
	
	def add_song(song)
		if !@songs.include?(song)
			@songs << song
		end
		if song.artist.nil?
			song.artist = self
		end
	end
	
	def self.create(name)
		if self.all.detect {|x| x.name == name}.nil?
			new_artist = self.new(name)
			new_artist.save
			new_artist
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