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
		song.artist = self unless song.artist == self
		self.songs << song unless self.songs.include?(song)
	end

	def genres
		self.songs.map {|song| song.genre }.uniq
	end
end
