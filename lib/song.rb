class Song

	attr_accessor :name, :artist
	@@all = []

	def initialize(name, *artist)
		@name = name
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
		song = self.new(name)
		song.save
		song
	end

	def artist=(artist)
		if !artist.songs.include?(self)
			artist.add_song(self)
		end
	end

	def find_by_name
		
	end

	def find_or_create_by_name
		
	end




end

# artist.songs << self

# rspec spec/001_song_basics_spec.rb
# rspec spec/004_songs_and_artists_spec.rb




