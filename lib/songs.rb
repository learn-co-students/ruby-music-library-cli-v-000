require 'pry'

class Song
	attr_accessor :name
	attr_reader :artist, :genre 

	@@all = []

	def initialize(name, artist=nil, genre=nil)
		@name = name

		artist ? self.artist = artist : artist = nil
		genre ? self.genre = genre : genre = nil
	end

	def self.find_by_name(nam)
		self.all.detect{|song| song.name == nam}
	end

	def self.find_or_create_by_name(nam)
		self.find_by_name(nam) ? self.find_by_name(nam) : self.create(nam)
	end

	def self.new_from_filename(file_names)

		if file_names.class == String
			arr = file_names.split(" - ")
			song = self.new(arr[1])
			song.artist_name(arr[0], song)
			mp3_split = arr[2].split(".")
			song.genre_name(mp3_split[0], song)
			song
		else
			file_names.each do |file|
				arr = file.split(" - ")
				song = self.new(arr[1])
				song.artist_name(arr[0], song)
				mp3_split = arr[2].split(".")
				song.genre_name(mp3_split[0], song)
				song
			end
		end
	end

	def self.create_from_filename(file_names)
		if file_names.class == String 
			create = self.new_from_filename(file_names)
			create.save
		else
			create = self.new_from_filename(file_names)
			create.each {|song| song.save}
		end
	end

	def artist_name(artist_name, song)
		artist = Artist.find_or_create_by_name(artist_name)
		artist.add_song(song)
	end

	def genre_name(genre_name, song)
		genre = Genre.find_or_create_by_name(genre_name)
		genre.add_song(song)
	end

	def self.create(nam)
		song = self.new(nam)
		song.save
		song
	end

	def artist=(artist)
		@artist = artist
		artist.add_song(self)
	end

	def genre=(genre)
		@genre = genre
		genre.add_song(self)
	end

	def self.all
		@@all
	end

	def save
		@@all << self
	end

	def self.destroy_all
		@@all.clear
	end

end



# song = Song.create("Kaohsiung Christmas")
# puts song.class
# puts Song.all
# Song.create("heavy")
# Song.create("light")
# Song.create("medium")
# Song.all










