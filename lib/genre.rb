class Genre

	attr_accessor :name
	
	@@all = []
	
	def initialize(name, genre=nil)
		@name = name
		@songs = []
	end
	
	def songs
		@songs
	end
	
	def add_song(song)
		(self.songs << song && song.genre = self) unless (self.songs.include?(song) && song.genre == self)	
	end
	
	def save
		self.class.all << self
	end
	
	def artists
		self.songs.collect {|song| song.artist}.uniq
	end
	
	def self.all
		@@all
	end
	
	def self.destroy_all
		self.all.clear
	end
	
	def self.create(name)
		genre = self.new(name)
		genre.save
		genre
	end
	
end
