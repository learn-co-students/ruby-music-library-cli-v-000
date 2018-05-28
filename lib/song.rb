require 'pry'

class Song
    attr_accessor :name
	attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist= nil, genre= nil)
        @name = name
		unless artist.nil?
			self.artist=(artist)
		end
		unless genre.nil?
			self.genre=(genre)
		end
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

    def self.create(name)
        song = self.new(name)
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

	def genres
		self.songs.collect {|song| song.genre}
	end
	def self.find_by_name(name)
		all.detect {|song| song.name == name}
	end

	def self.find_or_create_by_name(name)
		find_by_name(name) || create(name)
	end
	def self.new_from_filename(filename)
    	new_artist, new_song, new_genre = filename.split(" - ")
		song = Song.new(new_song)
		artist = Artist.find_or_create_by_name(new_artist)
        genre = new_genre.gsub(".mp3","")
		genre = Genre.find_or_create_by_name(genre)
		song.artist = artist
		song.genre = genre
		song
	end

	def self.create_from_filename(filename)
		new_from_filename(filename).save
	end
end
