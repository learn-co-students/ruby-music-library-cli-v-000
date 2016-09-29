require 'pry'
class Song
	attr_accessor :name, :genre, :artist
  
  extend Concerns::Findable
  
  @@all = []

	def initialize(name, artist=nil, genre=nil)
		@name = name
    if artist != nil
    	@artist = artist
		  @artist.add_song(self)
		end

		if genre != nil
		  @genre = genre 
		  @genre.add_song(self)
		end   
	end
    
	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

	def save
		self.class.all << self
	end

	def self.create(name)
		song = Song.new(name)
		song.class.all << song 
		song
	end

	def artist=(artist)
    if artist.is_a?(Artist)
      @artist = artist
      artist.add_song(self) 
    end 
	end

	def genre=(genre)
		 @genre = genre
		 genre.add_song(self)
	end

	def self.new_from_filename(filename)
		file = filename.split(" - ")
		name = file[1]
    the_artist = file[0]
    the_genre = file[2].gsub('.mp3', '')

		song = self.find_or_create_by_name(name)
    song.artist = Artist.find_or_create_by_name(the_artist) 
    song.genre = Genre.find_or_create_by_name(the_genre)
    song
	end
  
  def self.create_from_filename(filename)
	  song = self.new_from_filename(filename)
	  song
  end

end









