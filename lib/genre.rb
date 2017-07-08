class Genre
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

	def self.create(genre)
		genre = Genre.new(genre)
		genre.save
		genre
	end

	def add_song(song)
		if !@songs.include?(song)
			@songs << song
			song.genre = self
		end
	end

	def artists
		self.songs.collect {|song| song.artist}.uniq
	end
end