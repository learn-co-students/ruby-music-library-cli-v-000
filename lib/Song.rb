class Song

	attr_accessor :name
	attr_reader :artist, :genre
	@@all = []

	extend Concerns::Findable

	def initialize(name, artist = nil, genre = nil)
		@name = name
		self.artist = artist if artist
		self.genre = genre if genre
	end

	def save
		self.class.all << self
	end

	def artist=(artist)
		@artist = artist
		artist.add_song(self)
	end

	def genre=(genre)
		@genre = genre
		genre.songs << self unless genre.songs.include?(self)
	end

	def self.create(name)
		song = self.new(name)
		song.save
		song
	end

	def self.new_from_filename(filename)
		artist, name, genre = filename.gsub('.mp3', '').split(' - ')

		song = self.find_or_create_by_name(name)
		song.artist = Artist.find_or_create_by_name(artist)
		song.genre = Genre.find_or_create_by_name(genre)
		song
	end

	def self.create_from_filename(filename)
		self.new_from_filename(filename)
	end

	def self.all
		@@all
	end

	def self.destroy_all
		self.all.clear
	end

	def self.play(index)
		song = self.all[index - 1]
		puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
	end

	def self.print_songs
		self.all.each.with_index do |song, index|
			puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
		end
	end

	def self.print_songs_by_artist(name)
		self.all.select { |song| song.artist.name == name }.each do |song|
			puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
		end
	end

	def self.print_songs_by_genre(name)
		self.all.select { |song| song.genre.name == name }.each do |song|
			puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
		end
	end

end