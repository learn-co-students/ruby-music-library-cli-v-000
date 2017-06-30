class Genre
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

	def save
		@@all << self
	end

	def add_song(song)
    unless song.genre == self
		    song.genre = self
      end
    unless @songs.include?(song)
      @songs << song
    end
	end

	def self.destroy_all
		@@all.clear
	end

	def self.create(name)
		instance = self.new(name)
		instance.save
		instance
	end

	def songs
		@songs
	end

	def artists
		artists = []
		songs.each do |song|
			artists << song.artist
		end
		artists.uniq
  end
end
