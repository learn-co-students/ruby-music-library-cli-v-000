# let(:song) { Song.new("In the Aeroplane Over the Sea") }
# let(:artist) { Artist.new("Neutral Milk Hotel") }
class Song # belongs to an artist and genre

	attr_accessor :name
	attr_reader :artist, :genre
	
	@@all = []
	
	def initialize(name, artist=nil, genre=nil)
		@name = name
		self.artist=(artist) if artist != nil #song belongs to artist
		self.genre=(genre) if genre != nil #song belongs to genre
	end

	def artist=(artist)
			@artist = artist # song belongs to artist
			@artist.add_song(self) # artist has many songs -- passing in obj/song instance
	end
	
	def genre=(genre)
		@genre = genre  # song belongs to genre
		@genre.add_song(self) # genre has many songs-- passing in obj/song instance
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

	def self.create(song)
		new_song = Song.new(song)
		new_song.save
		new_song
	end

	def self.find_by_name(name) #=> arg = str
		@@all.detect { |song| song.name == name }
	end
	
	def self.find_or_create_by_name(name)
		self.find_by_name(name) || self.create(name)
	end

	def self.new_from_filename(filename)
			artist_name = filename.split(' - ')[0]
			song_title = filename.split(' - ')[1]
			new_genre = filename.split(' - ')[2].gsub!('.mp3', '')
			song = Song.new(song_title)
			song.artist = Artist.find_or_create_by_name(artist_name)
			song.genre = Genre.find_or_create_by_name(new_genre)			
			song
	end
	
	def self.create_from_filename(filename)
			new_song = self.new_from_filename(filename)		
			@@all << new_song
	end
end
