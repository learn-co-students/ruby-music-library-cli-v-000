class Song

	

	attr_accessor :name, :artist, :genre

	@@all = []

	def initialize(name, artist = nil, genre = nil)
		@name = name
		if artist != nil
		self.artist=(artist)
		end
		if genre !=	nil					
		self.genre=(genre)
		end
	end

	def self.all
		@@all
	end

	def self.destroy_all
		self.all.clear
	end

	def save
		self.class.all << self
	end

	def self.create(name)
	    song = self.new(name)
	    song.save
	    song
  	end

  	def self.new_from_filename(filename)
  		artist, song = filename.split(" - ")
  		genre = filename.split(" - ")[2].chomp(".mp3")
  		song = self.new(song)
  		song.artist = Artist.find_or_create_by_name(artist)
  		song.genre = Genre.find_or_create_by_name(genre)
  		song
  	end

  	def self.create_from_filename(filename)
  		new_from_filename(filename).save
  	end


  	def artist=(artist)
  		@artist = artist
  		artist.add_song(self) unless artist.songs.include?(self)
  	end

  	def genre=(genre)
  		@genre = genre
  		genre.songs << self unless genre.songs.include?(self)
  	end

  	def self.find_by_name(name)
  		self.all.detect {|song| song.name == name}
  	end

  	def self.find_or_create_by_name(name)
  		self.find_by_name(name)? self.find_by_name(name) : self.create(name)
  	end
end
