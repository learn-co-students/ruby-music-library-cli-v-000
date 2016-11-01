class Genre
	attr_accessor :name, :songs
	extend Concerns:Findable
	include Concerns::InstanceMethods

	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def self.all
		@@all
	end

	def artists
		self.songs.map { |song| song.artist }
	end
end
