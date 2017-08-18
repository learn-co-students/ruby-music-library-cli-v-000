class Song
	attr_accessor :name
	@@all = []

	def initialize(name, artist = nil, genre = nil)
		@name = name
		if genre != nil
			self.genre=(genre)
		end
		if artist != nil
			self.artist=(artist)
		end
	end

	def save
		@@all << self
	end

	def self.create(name)
		song = self.new(name)
		song.save
		song
	end

	def artist=(artist)
		@artist = artist
		artist.add_song(self)
	end

	def genre=(genre)
		@genre = genre
		if !genre.songs.include?(self)
			genre.add_song(self)
			genre.songs << self
		end
	end

	def artist
		@artist
	end

	def genre
		@genre
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end
end