class Genre
	extend Concerns::Findable

    attr_accessor :name, :song, :songs
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
        genre = Genre.new(name)
        genre.save
		genre
    end

	def add_song(song)
		song.genre.nil? ? song.genre = self : song.genre
		if !(songs.include?(song))
		 	songs << song
		end
	end

	def artists
		self.songs.collect {|song| song.artist}.uniq
	end

	def songs
		@songs
	end
end
