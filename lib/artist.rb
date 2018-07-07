class Artist

	attr_accessor :name
	@@all = []
	extend Concerns::Findable

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
		@@all << self	
	end
	
	def self.count
	  @@all.size
	end
	
	def self.create(name)
		artist = Artist.new(name)
		artist.save
		artist
	end
	
	def songs
		@songs
	end	
	
	def add_song(song)
	    song.artist = self unless song.artist == self
	    @songs << song unless self.songs.include?(song)
	end
	
	def genres
	  @songs.collect { |x| x.genre }.uniq
	end

end
