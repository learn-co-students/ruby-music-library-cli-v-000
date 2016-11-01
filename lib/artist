class Artist
	attr_accessor :name, :songs
	extend Concerns::Findable
	include Concerns::InstanceMethods


	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end


	def self.all
		@@all
	end

	def self.count
		@@all.size
	end

	def add_song(song)
		self.songs << song
		song.artist = self
	end

	def genres
		songs.map {|song| puts song.genre }.uniq
	end
end
