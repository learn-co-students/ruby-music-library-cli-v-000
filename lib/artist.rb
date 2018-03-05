class Artist

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
        artist = self.new(name) # This might be a issue "self" or "Class"
        artist.save
        artist
    end

    def add_song(song)
          if song.artist == nil
            song.artist = self
          end
          if !self.songs.include?(song)
              @songs << song
          end
    end

    def genres
        self.songs.collect{|s| s.genre}.uniq
    end



end
