class Artist
	attr_accessor :name, :songs
    
    extend Concerns::Findable

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

	def self.create(name)
		artist = Artist.new(name)
		artist.class.all << artist
		artist
	end

	def add_song(song)
		if !@songs.include?(song)
			@songs << song 
			song.artist = self
		end 
	end

	def genres
		  @songs.collect{|song| song.genre}.uniq
	end

end