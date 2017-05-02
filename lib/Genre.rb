class Genre

	attr_accessor :name, :songs
	@@all = []

	extend Concerns::Findable

	def initialize(name)
		@name = name
		@songs = []
	end

	def save
		self.class.all << self
	end

	def artists
		# refactor sandwich code
		results = []
		self.songs.each { |song| results << song.artist unless results.include?(song.artist) }
		results
	end

	def self.create(name)
		genre = Genre.new(name)
		genre.save
		genre
	end

	def self.all
		@@all
	end

	def self.destroy_all
		self.all.clear
	end

	def self.print_genres
		self.all.uniq { |genre| genre.name }.each { |genre| puts genre.name }
	end

end