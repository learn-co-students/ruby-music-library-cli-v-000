class Genre

  include Concerns::Findable

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
      self
    end

    def add_song(song)
      songs << song unless songs.include?(song)
      song.genre=(self) unless song.genre == self
    end

    def artists
      songs.collect {|song| song.artist}.uniq
    end

    def self.create(name)
      self.new(name).save
    end

    def self.destroy_all
      @@all.clear
    end

end
