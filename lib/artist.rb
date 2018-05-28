class Artist
	extend Concerns::Findable
    attr_accessor :song, :name, :songs, :artist
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

    def self.destroy_all
        @@all = []
    end

    def self.create(name)
        artist = Artist.new(name)
        artist.save
		artist
    end

	def songs
		@songs
	end	


    def add_song(song)
		song.artist.nil? ? song.artist = self : song.artist
		if !(songs.include?(song))
		 	songs << song
		end
	end

	def genres
		self.songs.collect {|song| song.genre}.uniq
	end
end
