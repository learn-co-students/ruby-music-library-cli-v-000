class Genre
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
		genre = Genre.new(name)
		genre.class.all << genre
		genre
	end

	def add_song(song)
		@songs << song unless @songs.include?(song)
	end

	def artists
		@songs.collect{|song| song.artist}.uniq
	end 

end