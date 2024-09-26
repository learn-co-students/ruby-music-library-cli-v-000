class Artist
	attr_accessor :name, :songs, :genre
	
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

	def self.create(artist)
		artist = self.new(artist)
	end

	def add_song(song)
		song.artist = self unless song.artist
		@songs << song unless @songs.include?(song)
	end

	def genres
		self.songs.map {|song| song.genre}.uniq
	end




end