class Artist
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :songs
    @@all = []
    
    def initialize(name)
        @name = name
        @songs = []
    end
    
    def genres
        self.songs.collect {|s| s.genre}.uniq
    end
    
    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def self.destroy_all
        self.all.clear
    end

    def self.create(name)
        song = self.new(name)
        song.save
        song
    end

    def add_song(song)
        @songs << song if !self.songs.include?(song)
        song.artist = self unless song.artist != nil
    end
end

#Artists have many genres through their songs. Implement a #genres method for this association.
