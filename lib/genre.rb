class Genre
    extend Concerns::Findable
    
    attr_accessor :name, :songs, :artist
    
    @@all = []
    
    def initialize(name)
        @name = name
        @songs = []
        save
    end
    
    def save
       @@all << self 
    end
    
    def self.all
       @@all 
    end
    
    def self.create(name)
       Genre.new(name)
    end
    
    def self.destroy_all
       @@all.clear 
    end
    
    def add_song(song)
        # binding.pry
        song.genre = self if song.genre == nil
        @songs << song if !@songs.include?(song)
    end
    
    def artists
      a = @songs.map {|song| song.artist}
      a.uniq
    end

end