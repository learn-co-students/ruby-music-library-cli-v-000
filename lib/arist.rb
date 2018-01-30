class Artist
    extend Concerns::Findable
  
    attr_accessor :name, :songs, :genres
    
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

      if song.artist != self
        song.artist = self
      end
    end
    
    def genres
      @songs.collect { |song| song.genre }.uniq
    end
end