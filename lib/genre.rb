class Genre
	extend Concerns::Findable
	attr_accessor :name, :songs
	@@all = []


	def self.all # Class reader
		@@all
	end

	def initialize(name)
		@name = name
		@songs = []
	end

	def save
		@@all << self
	end

	def add_song(song)
		self.songs << song unless @songs.include?(song)
		song.genre = self unless song.genre == self
	end

	def self.create(name)
		genre = self.new(name)
		genre.save
		genre
	end

	def self.destroy_all
		@@all.clear
	end

	def artists
		self.songs.collect {|song| song.artist}.uniq
	end
end