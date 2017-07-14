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

    def self.destroy_all
      @@all.clear
    end

    def save
      @@all  << self
    end

    def self.create(name)
      artist = Artist.new(name)
      artist.save
      self
    end

    def songs
      @songs
    end

    def add_song(song)
      @songs << song unless @songs.include?(song)
      song.artist = self unless song.artist == self
    end

    def genres
      self.songs.collect{|s|s.genre}.uniq
    end

    def Artist.find_or_create_by_name(name)
    if self.all.detect{|artist| artist.name == name} == nil
      Song.artist = Artist.new(name)
    else
      self.all.detect{|artist| artist.name == name}
    end

  end

end