
require 'pry'
class Artist
extend Concerns::Findable
attr_accessor :name
	@@all = []

	def self.all
		@@all
	end

	def initialize(name)
		@name = name
		@songs = []
	end

	def songs
		@songs
	end

	def save
		@@all << self
	end

	def self.destroy_all
		@@all = []
	end

	def self.create(name)
		temp_artist = self.new(name)
		temp_artist.save
		temp_artist

	end

	def add_song(song)
#binding.pry
	if song.artist == nil
		song.artist = self
	end
	if !@songs.include?(song)
		@songs << song
	end
	end

	def genres
 		genre_arr = []		
		self.songs.each{ |x| genre_arr << x.genre}
		genre_arr.uniq!
		genre_arr
	end


end