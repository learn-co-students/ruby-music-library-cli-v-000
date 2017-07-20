class Genre # has many songs
	extend Concerns::Findable	# #=> class module
	
	attr_accessor :name
	
	@@all = []
	
	def initialize(name)
		@name = name
		@songs = [] # genre has many songs
	end

	def self.all
		@@all
	end
	
	def self.destroy_all
		@@all.clear
	end
	
	def save
		@@all << self
	end

	def self.create(genre)
		new_genre = Genre.new(genre)
		new_genre.save
		new_genre
	end
	 
	 def songs # genre has many songs
		@songs	 
	 end	
	 
	 def add_song(song)
	 	@songs << song unless @songs.include?(song) # genre has many songs
	 end
	 
	 def artists # genre has many artists through songs
	 	self.songs.map { |song| song.artist }.uniq
	 end
end
