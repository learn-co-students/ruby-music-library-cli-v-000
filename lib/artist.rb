class Artist
  extend Concerns::Findable

	attr_accessor :name

	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def self.all
		@@all
	end

	def add_song(song)
    unless song.artist == self
		    song.artist = self
      end
    unless @songs.include?(song)
      @songs << song
    end
	end

	def save
		@@all << self
	end

	def self.destroy_all
		@@all.clear
	end

	def songs
		@songs
	end

	def self.create(name)
		instance = self.new(name)
		instance.save
		instance
	end

	def genres
		genres = []
		songs.each do |song|
			genres << song.genre
		end
		genres.uniq
	end

end
