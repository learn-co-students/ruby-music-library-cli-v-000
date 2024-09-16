# let(:song) { Song.new("In the Aeroplane Over the Sea") }
# let(:artist) { Artist.new("Neutral Milk Hotel") }	
class Artist # has many songs
	extend Concerns::Findable	# #=> class module
	
	attr_accessor :name
	
	@@all = []
	
	def initialize(name)
		@name = name
		@songs = [] # artist has many songs
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
	
	def self.create(artist)
		new_artist = Artist.new(artist)
		new_artist.save
		new_artist
	end
	
	def songs # artist has many songs
		@songs
	end

	def add_song(song) #=> passing in a song instance
		song.artist = self unless song.artist == self #song belongs to artist
		@songs << song unless @songs.include?(song) # artist has many songs
# binding.pry
	end
	
	def genres # artist has many genres through songs
		self.songs.map { |song| song.genre }.uniq 
	end
end
