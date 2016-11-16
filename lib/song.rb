require 'pry'


class Song
extend Concerns::Findable

attr_accessor :name
attr_reader :artist, :genre

	@@all = []

	def initialize(name, artist = nil, genre = nil)
		@name = name
		@artist = artist
		@genre = genre
		if artist != nil
			artist.add_song(self) unless artist.songs.include?(self)
		end
		if genre !=nil
			genre.add_song(self) unless genre.songs.include?(self)
		end
	end

	def self.new_from_filename(filename)
		file_name_array = filename.split(/\s-\s|\./)
		artist_piece = file_name_array[0]
		song_piece = file_name_array[1]
		genre_piece = file_name_array[2]
		song = self.find_or_create_by_name(song_piece)
		song.artist = Artist.find_or_create_by_name(artist_piece)
		song.genre = Genre.find_or_create_by_name(genre_piece)
		song
	end

	def self.create_from_filename(filename)
		song= self.new_from_filename(filename)
		song
	end

	def self.find_by_name(name)
		self.all.find{|song| song.name == name}
	end

	def self.find_or_create_by_name(name)
		self.find_by_name(name)? self.find_by_name(name) : self.create(name)
	end

	def artist=(artist)
		@artist = artist
		artist.add_song(self) unless artist.songs.include?(self)
	end

	def genre=(genre)
		@genre = genre
		genre.add_song(self) unless genre.songs.include?(self)
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

	def self.create(name)
    new(name).tap{|a| a.save}
  	end

end
