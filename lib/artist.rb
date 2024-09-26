class Artist
	extend Concerns::Findable
	attr_accessor :name, :songs

	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def save
		@@all << self
	end

	def add_song(song)
		song.artist = self if song.artist == nil
		@songs << song unless @songs.detect {|s| s.name == song.name}
	end

	def genres
		genres = []
		@songs.each do |song|
			genres << song.genre
		end
		genres.uniq
	end




	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

	def self.create(name)
		artist = self.new(name)
		artist.save
		artist
	end
end
