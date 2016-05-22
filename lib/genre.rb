class Genre
    extend Concerns::Findable
  
    attr_accessor :name, :songs
    
    @@all = []
  
    def initialize(name)
      @name = name
      @songs = []
      @@all << self
    end
    
    def self.create(name)
      self.new(name)
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
    
    def add_song(song)
      alreadyAdded = false
      
      @songs.each do |currSong|
          if currSong.name == song.name
            alreadyAdded = true
          end
      end
      
      if !alreadyAdded
        @songs << song
      end
      
      if song.genre != self
        song.genre = self
      end
    end
    
    def genres
        @genres = []
        
        @songs.each do |song|
            if !@genres.include?(song.genre)
                @genres << song.genre
            end
        end
        
        @genres
    end
    
    def artists
      @songs.collect { |song| song.artist }.uniq
    end
end