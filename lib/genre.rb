class Genre
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
		genre = self.new(name)
		@@all << genre
		genre
	end
	
	def songs
		@songs
	end

	def add_song(song)
		if song.genre != self
			song.genre = self
			@songs << song
		end
	end

	def artists
		@songs.collect {|song| song.artist}
	end

	def self.destroy_all
		@@all.clear
	end
end