class Artist
	extend Concerns::Findable
	attr_accessor :name, :songs

	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

	def save
		self.class.all << self
	end

	def self.create(artist)
		artist = Artist.new(artist)
		artist.save
		artist
	end

	def add_song(song)
		if !@songs.include?(song)
			@songs << song
			song.artist = self
		end
	end

	def genres
		self.songs.collect {|song| song.genre}.uniq
	end

end