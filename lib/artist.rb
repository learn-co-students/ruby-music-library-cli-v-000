require 'pry'

class Artist
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
		@@all = []
	end

	def save
		@@all << self
	end

	def self.create(name)
		artist = Artist.new(name)
		artist.save
		artist
	end

	def add_song(song)
		@songs << song if !@songs.include?(song)
		song.artist = self if song.artist == nil
	end

	def genres
		@songs.collect do |song|
			song.genre
		end.uniq
	end

	def self.alphabetized_by_name
		copy_of_all = Array.new(@@all)

		(copy_of_all.length - 1).times do |index|
			current_spot = 0

			while current_spot < (copy_of_all.length - 1)
				if copy_of_all[current_spot].name > copy_of_all[current_spot + 1].name
					placeholder = copy_of_all[current_spot]
					copy_of_all[current_spot] = copy_of_all[current_spot + 1]
					copy_of_all[current_spot + 1] = placeholder
					#switch their spots
				end
				current_spot += 1
			end
		end
		copy_of_all
	end
end