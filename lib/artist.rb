require 'pry'
class Artist
	attr_accessor :name, :songs

	extend LifeCycle::ClassMethods
	extend Concerns::Findable
	include LifeCycle::InstanceMethods

	def initialize(name)
		@name = name
		@songs = []

		
	end
	
	@@all = []

	def self.all
			@@all
		end

	def add_song(song)
		has_song= @songs.detect do |current_song|
			current_song == song
		end

		if !(has_song)
		@songs << song

		end
		song.artist = self unless song.artist

	end

	def genres
		genres = []
		@songs.each do |song|
			genres << song.genre unless genres.detect {|genre| genre == song.genre}
		end
		genres
	end

end