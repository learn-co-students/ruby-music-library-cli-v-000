class Genre
  attr_accessor :name, :artist, :songs
  extend Concerns::Findable
  include Concerns::Findable

  @@all= []

    def initialize(name, artist=nil)
      @name = name
      @songs = []
      @@all << self
    end

    def self.all
      @@all
    end

    def save
      @@all << self
    end

    def self.create(name)
       self.new(name)
    end


    def self.destroy_all
      @@all.clear
    end

    def add_song(song)
     self.songs << song unless songs.include?(song)
     song.genre = self if song.genre.nil?
    end

    def artists
      songs.map{|g| g.artist}.uniq
    end

end
