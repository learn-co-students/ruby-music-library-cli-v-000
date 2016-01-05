class Song
	attr_accessor :name
	attr_reader :artist, :genre

	@@all = []

	def initialize(name, artist=nil, genre=nil)
		@name = name
		unless artist == nil 
			@artist = artist
			@artist.add_song(self)
		end
		unless genre == nil
			@genre = genre
			@genre.add_song(self)
		end
	end

	def save
		@@all << self
	end

	def self.all
		@@all #trying to sort this.  didn't solve the issues
	end

	def self.destroy_all
		@@all.clear
	end

	def self.create(name)
		s = self.new(name)
		s.save
		s
	end

	def artist=(artist)
		@artist = artist
		artist.add_song(self)
	end

	def genre=(genre)
		@genre = genre
		genre.add_song(self)
	end

	def self.find_by_name(song)
		@@all.find {|f| f.name == song}
	end

	def self.find_or_create_by_name(song)
		unless (@@all.find {|f| f.name == song})
			Song.create(song)
		end
		@@all.find {|f| f.name == song}
	end

	def self.new_from_filename(filename)
		array_name = filename[0..-5].split(/[-]\W/).map {|f| f.strip}
		a = Artist.find_or_create_by_name(array_name[0])
		g = Genre.find_or_create_by_name(array_name[2])

		self.new(array_name[1], a, g)

	end

	def self.create_from_filename(filename)
		array_name = filename[0..-5].split(/[-]\W/).map {|f| f.strip}
		a = Artist.find_or_create_by_name(array_name[0])
		g = Genre.find_or_create_by_name(array_name[2])
		s =  self.new(array_name[1], a, g)
		@@all << s
		s
	end

# song = Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")

#       expect(song.name).to eq("For Love I Come")
#       expect(song.artist.name).to eq("Thundercat")
#       expect(song.genre.name).to eq("dance")
end

	  # - For Love I Come - dance.mp3")
      # expect(song.artist).to eq(artist)
      # expect(song.genre).to eq(genre)
