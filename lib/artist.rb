class Artist
    attr_accessor :name, :songs
    extend Concerns::Findable
    include Concerns::Findable

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

    def self.destroy_all
      @@all.clear
    end

    def self.create(name)
       self.new(name)
    end

    def songs
      @songs
    end

    def add_song(song)
     self.songs << song unless songs.include?(song)
     song.artist = self if song.artist.nil?
    end

    def genres
        songs.collect{|g| g.genre}.uniq
    end


end
