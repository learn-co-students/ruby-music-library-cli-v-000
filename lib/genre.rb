class Genre
	attr_accessor :name, :artist, :songs

	extend Concerns::Findable

	@@all = []

	def initialize(name, artist = nil)
		@name = name
		@artist = artist
		@songs = []
	end

	def self.all
		@@all
	end

	def save
		@@all << self
	end

	def self.destroy_all
		self.all.clear
	end

	def self.create(name)
		self.new(name).tap { |s| s.save }
	end

	def songs
		@songs
	end

	def add_song(song)
		@songs << song unless @songs.include?(song)
		song.genre = self unless song.genre == self
	end

	def artists
		self.songs.collect { |s| s.artist }.uniq
	end

	def to_s
    self.name
  end
end