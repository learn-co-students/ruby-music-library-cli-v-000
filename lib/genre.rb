class Genre
	attr_accessor :name, :songs

	extend LifeCycle::ClassMethods
	extend Concerns::Findable
	include LifeCycle::InstanceMethods

	def initialize(name)
		@name = name
		@songs = []
	end

	@@all = []

	def self.all
		@@all
	end

	def add_song(song)
		has_song= @songs.detect do |current_song|
			current_song == song
		end
		
		if !(has_song)
		@songs << song

		end
		song.genre = self unless song.genre
	end

		def artists
		artists = []
		@songs.each do |song|
			artists << song.artist unless artists.detect {|artist| artist == song.artist}
		end
		artists
	end
	
end