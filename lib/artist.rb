require 'pry'
class Artist

	attr_accessor :name, :songs
	@@all = []

	def initialize(name)
		@name = name
		@songs = []
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
		artist = self.new(name)
		artist.save
		artist
	end

	def add_song(song)
		if !self.songs.include?(song)
			song.artist = self
			@songs << song
		end
	end

end

# rspec spec/002_artist_basics_spec.rb
# rspec spec/004_songs_and_artists_spec.rb





