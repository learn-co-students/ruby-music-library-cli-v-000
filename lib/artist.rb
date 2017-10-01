class Artist
  extend Concerns::Findable
    attr_accessor :name
    attr_accessor :songs
    @@all =[]

    def initialize (name)
      @name = name
      @songs = []
      save
    end

    def save
      self.class.all << self
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end

    def self.create(name)
      new_artist = new(name)
      new_artist.save
      new_artist
    end

    def add_song(song)
      song.artist = self unless song.artist
      songs << song unless songs.include?(song)
    end

    def genres
      songs.collect{ |s| s.genre}.uniq
    end
end
