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

	def save
		@@all << self
	end

	def self.create(name)
		artist = self.new(name)
		@@all << artist
		artist
	end

	def songs
		@songs
	end

	def add_song(song)
		if song.artist != self
			song.artist = self
			@songs << song
		end
	end

	def genres
		@songs.collect {|song| song.genre}
	end

	def self.destroy_all
		@@all.clear
	end
end