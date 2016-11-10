require_relative 'concerns/findable.rb'

class Artist
	extend Concerns::Findable
	attr_accessor :name, :genre
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
		artist = Artist.new(name)
		artist.save
		artist
	end

	def add_song(song)
		if !self.songs.include?(song)
			@songs << song
			song.artist=self
		end
	end

	def genres
		self.songs.map { |s| s.genre }.uniq
	end


end
