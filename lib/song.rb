require 'pry'

class Song

	attr_accessor :name
	attr_reader :artist, :genre

	@@all = []

	def initialize(name, artist=nil, genre=nil)
		@name = name
		self.artist = artist if artist != nil
		self.genre = genre if genre != nil
	end

	def self.new_from_filename(filename)
		# "Thundercat - For Love I Come - dance.mp3"

		filename_array = filename.split(' - ')
		# ["Thundercat", "For Love I Come", "dance.mp3"]

		song_name = filename_array[1]
		artist_name = filename_array[0]
		genre_name = filename_array[2].split('.')[0]

		artist = Artist.find_or_create_by_name(artist_name)
		genre = Genre.find_or_create_by_name(genre_name)

		song = self.new(song_name, artist, genre)
	end

	def self.create_from_filename(filename)
		@@all << new_from_filename(filename)
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
		song = Song.new(name)
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

	def self.find_by_name(name)
		@@all.detect {|song| song.name == name}
	end

	def self.find_or_create_by_name(name)
		if find_by_name(name)
			find_by_name(name)
		else
			create(name)
		end
	end

	def output_format
		"#{self.artist.name} - #{self.name} - #{self.genre.name}"
	end

	def self.alphabetized_by_name
		copy_of_all = Array.new(@@all)

		(copy_of_all.length - 1).times do |index|
			current_spot = 0

			while current_spot < (copy_of_all.length - 1)
				if copy_of_all[current_spot].name > copy_of_all[current_spot + 1].name
					placeholder = copy_of_all[current_spot]
					copy_of_all[current_spot] = copy_of_all[current_spot + 1]
					copy_of_all[current_spot + 1] = placeholder
					#switch their spots
				end
				current_spot += 1
			end
		end
		copy_of_all
	end
end