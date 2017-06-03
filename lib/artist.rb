class Artist

  extend Concerns::Findable

    attr_accessor :name, :songs, :genre

    @@all = []

    def initialize(name)
      @name = name
      @songs = []
    end

    def self.all
      @@all
    end

    def save
      @@all.push(self)
    end

    def self.destroy_all
      @@all.clear
    end

    def self.create(name)
      artist = self.new(name)
      artist.save
      artist
    end

    def add_song(song)
      if !(@songs.include?song)
      @songs.push(song)
      song.artist = self
    end
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end


end
