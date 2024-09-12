require 'pry'
class Song
	attr_accessor :name, :genre
	attr_reader :artist

	extend LifeCycle::ClassMethods
	extend Concerns::Findable
	include LifeCycle::InstanceMethods
	

	def initialize(name, artist= artist , genre = genre)
		@name = name
		@artist = artist 
		artist.songs << self unless !artist
		@genre= genre
		genre.add_song(self) unless !genre
	
	end

	@@all = []

	def self.all
		@@all
	end

	def artist=(artist)

		if !(artist.respond_to?(:name)) 
	
				if Artist.find_by_name(artist)  
					artist_obj = Artist.find_by_name(artist)
					@artist = artist_obj
					artist_obj.add_song(self)
				else     
					artist_obj = Artist.new(artist)
					
					artist_obj.class.all << artist_obj

					@artist = artist_obj
					artist_obj.add_song(self)
				end
	elsif (artist.respond_to?(:name))
			@artist = artist
			artist.add_song(self)
		end
	end

	def genre=(genre)
			if !(genre.respond_to?(:name)) #check if object 
				if Genre.find_by_name(genre)    
					genre_obj = Genre.find_by_name(genre)
					@genre = genre_obj
					genre_obj.add_song(self)
				else     
					genre_obj = Genre.new(genre)
					genre_obj.class.all << genre_obj
					@genre = genre_obj
					genre_obj.add_song(self)
				end
	elsif (genre.respond_to?(:name))
			@genre = genre
			genre.add_song(self)
		end
	end

	def self.new_from_filename(filename)
		artist, new_song, genre= filename.split(" - ")
		new_song= self.new(new_song)
		new_song.artist = artist
		new_song.genre = genre.scan(/^\w+-?\w+/).join("")     
		#binding.pry
		return new_song

		
	end

	def self.create_from_filename(filename)
		artist, new_song, genre= filename.split(" - ")
		
		new_song= self.new(new_song)

		new_song.artist = artist
		new_song.genre = genre.scan(/^\w+-?\w+/).join("")

		#if !(self.find_by_name(new_song.name) == new_song.name)
			#binding.pry
			self.all << new_song
		#end
		new_song
	end
end

