class Artist

	extend Concerns::Findable

	@@all = []

	attr_accessor :name, :songs

	def initialize(name)
		@name = name
		@songs = []
	end

	def save
		@@all << self
	end

	def genres
		song_genres = @songs.collect {|song| song.genre}
		song_genres.uniq
	end

	def add_song(song)
		if !@songs.include?(song)
			@songs << song
		end
		song.artist = self unless song.artist == self
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

  def self.create(name)
  	new_artist = self.new(name)
  	new_artist.save
  	new_artist
  end

end