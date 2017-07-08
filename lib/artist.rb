class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
      @name = name
      @songs = []
    end

    def self.all
      @@all
      # binding.pry
    end

    def save
      @@all << self
    end

    def self.destroy_all
      @@all.clear
    end

    def self.create(name)
      s = new(name)
      s.save
      s
    end

    def songs
      @songs
    end

    def add_song(song)
      exists = @songs.find(ifnone = nil) { |song_name| song_name == song }
      if exists == nil
        @songs << song
      end
      if song.artist == nil
        song.artist = self
      end
    end

end
