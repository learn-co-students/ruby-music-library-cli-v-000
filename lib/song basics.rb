class Song
	attr_accessor :name
	attr_reader :artist, :genre
	@@all = []
	def initialize(name,artist=nil, genre=nil)
		@name =name
		if !artist.nil?
		self.artist=(artist)
		end
		if !genre.nil?
			@genre = genre
			if !genre.songs.include?(self)
				genre.songs << self
			end
		end
	end
	
	def self.find_by_name(name)
		print_name = @@all.detect { |x| x.name == name }
		print_name
	end
	
	def self.find_or_create_by_name(name)
		if @@all.detect { |x| x.name == name}.nil?
			print_name = self.create(name)
		else 
			@@all.detect { |x| x.name == name}
		end
	end
	
	def genre(genre)
		@genre = genre
		if !genre.songs.include?(self)
			genre.songs << self
		end
	end
	
	def artist=(artist)
		@artist = artist
		artist.add_song(self)
	end
	
	def save
		@@all << self
	end
	
	def self.create(name)
		new_song = self.new(name)
		new_song.save
		new_song
	end
	
	def self.all
		@@all
	end
	
	def self.destroy_all
		@@all.clear
	end
	
end