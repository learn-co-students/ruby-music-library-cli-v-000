class Genre
	attr_accessor :name
	
	extend Concerns::Findable
	
	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def self.create(name)
		genre = self.new(name)
		genre.save
		genre
	end

	def self.all
		@@all
	end

	def save
		@@all << self
	end

	def self.destroy_all
		@@all.clear
	end

	def artists
		@songs.collect {|song| song.artist}.uniq
	end

	def add_song(song)
		if !song.genre && !self.songs.include?(song)
			song.genre = self
			@songs << song
		elsif !self.songs.include?(song)
			@songs << song
		end
	end

	def songs
		@songs
	end

end