class Genre
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
		song.genre = self if song.genre == nil
		@songs << song unless @songs.detect {|s| s.name == song.name}
	end

	def artists
		artists = []
		@songs.each do |song|
			artists << song.artist
		end
		artists.uniq
	end



	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

	def self.create(name)
		genre = self.new(name)
		genre.save
		genre
	end
end
