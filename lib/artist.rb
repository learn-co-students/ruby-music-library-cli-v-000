class Artist
    extend Concerns::Findable
    attr_accessor :name, :songs
    @@all = []
    def initialize(name)
      @name = name
      @songs = []
    end
  
    def self.all
      @@all
    end
  
    def save
      @@all << self
    end
  
    def self.destroy_all
      @@all.clear
    end
  
    def self.create(name)
      artist = Artist.new(name)
      artist.save
      artist
    end
  
    def add_song(song)
      @songs << song unless @songs.include?(song)
      song.artist = self unless song.artist == self
    end
    def genres
      list = []
      @songs.each do |song| list << song.genre end
      list.uniq
    end
  
  end
  