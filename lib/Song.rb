

class Song

	extend Concerns::Findable
	attr_accessor :name
	attr_reader :artist, :genre

	@@all= []

	def initialize(name, artist=nil, genre=nil)
		@name = name
		self.artist=artist if artist!=nil
		self.genre=genre if genre!=nil
		self.save
	end

	def self.all
		@@all
	end

	def save
		@@all << self
	end

	def self.destroy_all
		@@all = []
	end

	def self.create(name)
		self.new(name)
	end

	def artist= (nam)
		@artist= nam
		nam.add_song(self)
	end

	def genre=(gen)
		@genre=gen
		gen.songs << self if !gen.songs.include?(self)
	end

	def self.new_from_filename(file)
		temp=file.split(" - ")
		temp[2] = temp[2].split(".")[0]
		new_song = self.find_or_create_by_name(temp[1])
		new_song.artist= Artist.find_or_create_by_name(temp[0])
		new_song.genre= Genre.find_or_create_by_name(temp[2])
		new_song
	end

	def self.create_from_filename(file)
		self.new_from_filename(file)
	end

end