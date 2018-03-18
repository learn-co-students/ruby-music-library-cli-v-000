class Artist
	extend Concerns::Findable

	attr_accessor :name, :songs
 
	@@all = []

	def initialize(name)
		@name = name
		self.songs = []
		save
	end
	
	def self.all
		@@all
	end
	
	def self.destroy_all
		@@all = []
	end
	
	def save
		@@all << self
	end
	
	# def self.create(name)
	# 	Artist.new(name)
	# end


	def self.create(name)
		artist = Artist.new(name)
		artist.save
		artist
	end
	
	def add_song(song)
		# even though we could, we are NOT checking if current Artist has this song, such as:   self.songs.include?(song)
		# instead, we are checking if 'song' has an artist property equal to 'self' (ie: current instance of Artist)
		# and if song.artist is not the same as 'self', we set this song's artist EQUAL to self

    if song.artist != self
      song.artist = self
		end
		
		# THEN we check for self.songs whether it includes this particular song yet
    if !@songs.include?(song)
      @songs << (song)
    end
  end
 
	def genres
		@genres = []
		self.songs.each do |song|
			@genres.push(song.genre)
		end
		@genres.uniq
	end
end