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
	 
	def self.create(name)
		artist = Artist.new(name)
		artist.save
		artist
	end
	
	def add_song(song)
		# even though we could, we are NOT checking if current Artist has this song, such as:   self.songs.include?(song)
		# instead, we are checking if the (song) has an artist property equal to this instance of Artist 'self' (current instance of Artist)
		# if song.artist != self, we then set set.artist = self

    if song.artist != self
      song.artist = self
		end
		
		# THEN we check self.songs whether it includes this particular song yet
			# we are associating the Song object (song) with and Artist object (self)
 
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