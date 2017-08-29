
class Genre
extend Concerns::Findable
attr_accessor :name
	@@all = []

	def self.all
		@@all
	end

	def initialize(name)
		@name = name
		@songs = []
	end

	def songs
		@songs
	end

	def save
		@@all << self
	end

	def self.destroy_all
		@@all = []
	end

	def self.create(name)
		temp_genre = self.new(name)
#binding.pry
		temp_genre.save
		temp_genre

	end

	def add_song(song)
#binding.pry
	if song.genre == nil
		song.genre = self
	end
	if !@songs.include?(song)
		@songs << song
	end
	end

	def artists
 		artist_arr = []	

		self.songs.each{ |x| artist_arr << x.artist}

		artist_arr.uniq!
		artist_arr
	end

end