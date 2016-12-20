class Song
    attr_accessor :name, :artist, :genre
        extend Concerns::Findable
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def save
        @@all << self
    end

    def self.create(name, artist = nil, genre = nil)
        song = self.new(name, artist, genre)
        song.save
        song
    end
    

    def self.find_by_name(name)
    	self.all.detect do |s|
    		s.name == name
    	end
    end

    def self.find_or_create_by_name
        self.find_by_name(name) || self.create(name)
    end








end
