require_relative 'concerns/findable.rb'
class Genre
	extend Concerns::Findable

	attr_accessor :name, :songs, :artists

	@@all = []

	def initialize(name, genre = nil)
	@name = name
	@genre = genre
	@songs = []
	end

	def self.all
		@@all
	end

	def self.create(name)
		new(name).tap {|s| s.save}
	end
	
	def self.destroy_all
		@@all = []
	end

	def self.create_by_name(name)
		new(name).tap {|s| s.save}
	end

	def save
		@@all << self
	end

	def add_song(song)
		song.genre = self unless song.genre == self
		@songs << song unless songs.include?(song)
	end

	def artists
		self.songs.collect {|a| a.artist}.uniq
	end
end