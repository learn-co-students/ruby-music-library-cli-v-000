class Genre
	attr_accessor :name, :songs

	extend Concerns::Findable


	@@all = []

	def initialize(name)
		@name = name
		@@all << self
		@songs = []
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

	def save
		@@all << self
	end

	def self.create(genre)
		genre = self.new(genre)
		
	end

	def add_song(song)
		song.genre = self unless song.genre
		@songs << song unless @songs.include?(song)
	end

	def artists
		self.songs.map {|song| song.artist}.uniq
	end







end