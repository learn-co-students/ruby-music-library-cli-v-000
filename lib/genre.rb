class Genre
	extend Concerns::Findable
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
		genre = self.new(name)
		genre.save
		genre
	end

	def add_song(song)
		song.genre = self if song.genre != self
		@songs << song if !self.songs.include?(song)
	end

	def artists
		self.songs.collect {|s| s.artist}.uniq
	end



end

# rspec spec/003_genre_basics_spec.rb
# rspec spec/005_songs_and_genres_spec.rb
# rspec spec/006_artists_and_genres_spec.rb




