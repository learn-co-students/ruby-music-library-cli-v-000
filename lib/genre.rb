class Genre
	attr_accessor :name, :songs
	extend Concerns::Findable

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

	def add_song(song)
		if song.genre != self
			song.genre = self
			@songs << song
		end
	end

	def artists
		@songs.collect {|song| song.artist}.uniq
	end

	def self.destroy_all
		@@all.clear
	end
end
