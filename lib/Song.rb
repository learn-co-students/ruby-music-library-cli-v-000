class Song
	extend Concerns::Findable

	attr_accessor :name, :artist, :genre

	@@all = []
	def initialize(name, artist= nil, genre= nil)
		@name = name
		self.artist=(artist) unless artist == nil
    	self.genre=(genre) unless genre == nil
	end

	def save
		@@all << self
	end

	def self.destroy_all
		@@all.clear
	end

	def self.all
		@@all
	end

	def self.create(name)
		song = new(name)
		song.save
		song
	end

	def artist=(artist)
    	@artist = artist
    	artist.add_song(self)
  	end

  	def genre=(genre)
    	@genre = genre
    	genre.songs << self unless genre.songs.include?(self)
  	end

	def self.find_by_name(name)
    	all.detect {|song| song.name == name}
  	end

  	def self.new_from_filename(filename)
    	parsed = filename.split(" - ")
    	artist_name, song_name, genre_name = parsed[0], parsed[1], parsed[2].gsub(".mp3", "")

    	artist = Artist.find_or_create_by_name(artist_name)
   	 	genre = Genre.find_or_create_by_name(genre_name)

    	new(song_name, artist, genre)
  	end

  	def self.create_from_filename(file)
    	new_song = self.new_from_filename(file)
    	new_song.save
  	end


  	def self.find_or_create_by_name(name)
  		self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    end
end