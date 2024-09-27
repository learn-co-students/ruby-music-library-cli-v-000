require_relative 'concerns/findable.rb'

class Genre
	extend Concerns::Findable 
	attr_accessor :name
	attr_reader :songs 

	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def self.all
		@@all 
	end

	def self.destroy_all
		self.all.clear
	end

	def save
		self.class.all << self
	end

	def self.create(name)
		genre = Genre.new(name)
		genre.save
		genre
	end

	def add_song(song)
		if songs.include?(song)
			return nil
		elsif song.artist == nil
			song.artist=self
		else
			self.songs << song
		end
			
	end

	def artists
		self.songs.map { |s| s.artist }.uniq
	end
end