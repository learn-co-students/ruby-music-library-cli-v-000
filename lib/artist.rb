require_relative('./songs.rb')
require_relative('./genre.rb')

class Artist
	attr_accessor :name, :songs
	
	extend Concerns::Findable

	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def self.create(name)
		artist = self.new(name)
		artist.save
		artist
	end

	def self.all
		@@all
	end

	def save
		@@all << self
	end

	def self.destroy_all
		@@all.clear
	end

	def add_song(song)
		if !song.artist
			song.artist = self
		elsif !self.songs.include?(song)
			@songs << song
		end
	end

	def genres
		@songs.collect {|song| song.genre}.uniq
	end

end

# moo = Artist.new("Moo")
# woof = Song.new("Woof")
# moo.add_song(woof)
# # moo
# moo.songs.each {|song| puts song.name}


