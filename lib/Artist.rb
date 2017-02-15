

class Artist
	extend Concerns::Findable
	attr_accessor :name, :songs
	@@all= []

	def initialize(name, song=[])
		@name = name
		@songs = []
		self.save
	end

	def self.all
		@@all
	end

	def save
		@@all << self
	end

	def self.destroy_all
		@@all = []
	end

	def self.create(name)
		self.new(name)
	end

	def add_song(song)
		@songs << song if !@songs.include?(song)
		song.artist = self if song.artist != self
	end

	def genres
		@songs.map{|s| s.genre}.uniq
	end


end