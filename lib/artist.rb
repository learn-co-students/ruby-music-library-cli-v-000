class Artist

extend Concerns::Findable
  
  attr_accessor :name
  @@all = []
    def initialize(name)
      @name = name
      @songs = []
    end
    def songs
      @songs
    end
    def add_song(song)
      unless @songs.include?(song) 
        @songs << song
        song.artist = self
      end 
    end
    def genres
      self.songs.map {|song| song.genre}.uniq 
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
      artist = Artist.new(name)
      artist.save
      artist   
    end
end