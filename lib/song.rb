class Song
	attr_accessor :name, :artist, :genre
	@@all = []

	


	def self.all # Class reader
		@@all
	end

	def initialize(name, artist=nil, genre=nil)
    #used to have != nil here, but don't actually need that there
    self.artist = artist if artist #!= nil 
    self.genre = genre if genre #!= nil
    @name = name
  	end


	def save
		@@all << self
	end

	def self.create(name)
		song = self.new(name)
		song.save
		song
	end
	def self.new_from_filename(filename)
    names = filename.split(/ - |.mp3/)
    artist = Artist.find_or_create_by_name(names[0])
    genre = Genre.find_or_create_by_name(names[2])
    Song.new(names[1], artist, genre)
  end

 	# does the same as previous code but is refactored

 	# def self.create(name, artist = nil, genre = nil)
 	# 	new(name, artist, genre).tap{|song| song.save}
 	# end

	def artist=(artist)
		@artist = artist
		artist.add_song(self)
	end

	def genre=(genre)
		@genre = genre
		genre.add_song(self)
	end

	def self.destroy_all
		@@all.clear
	end

	def self.find_by_name(name)
		all.detect {|song| song.name == name}
	end

	def self.find_or_create_by_name(name)
		find_by_name(name) || create(name)
	end

	def self.create_from_filename(file)
		song = Song.new_from_filename(file)
		song.save
		song
	end


end
