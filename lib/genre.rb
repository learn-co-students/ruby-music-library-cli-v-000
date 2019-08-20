class Genre

  attr_accessor :name, :songs, :artist
  @@all = []

  def initialize(name)
    @name = name
    @songs = []

  end

  def artists
    @songs.map {|song| song.artist}.uniq
  end

  def songs
    @songs
  end

    def save
      @@all << self
    end

    def self.create(name)
      song = Genre.new(name)

      @@all << song
      song
      end

    def self.all
    @@all
    end

    def self.destroy_all
      @@all.clear
    end

end
