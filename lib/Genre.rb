

class Genre
	extend Concerns::Findable
	attr_accessor :name, :songs

	@@all= []

	def initialize(name)
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

	def artists
		@songs.map{|s| s.artist}.uniq
	end

end