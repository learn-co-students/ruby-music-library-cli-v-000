class Artist

	attr_accessor :name, :songs
	@@all = []

	extend Concerns::Findable

	def initialize(name)
		@name = name
		@songs = []
	end

	def save
		self.class.all << self
	end

	def add_song(song)
		song.artist ||= self
		self.songs << song unless self.songs.include?(song)
	end

	def genres
		self.songs.collect { |song| song.genre }.uniq
	end

	def self.create(name)
		artist = self.new(name)
		artist.save
		artist
	end

	def self.all
		@@all
	end

	def self.destroy_all
		self.all.clear
	end

	def self.print_artists
		self.all.uniq { |artist| artist.name }.each { |artist| puts artist.name }
	end

end