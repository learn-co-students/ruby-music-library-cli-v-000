class Genre
  extend  Concerns::Findable
  attr_accessor :name, :songs

    def initialize(name)
      @name = name
      @@all << self
      @songs=[]
    end

    def self.all
    @@all
    end

    def self.destroy_all
      @@all = []
    end

    def save
      @@all << self
    end

    def self.create(name)
      genre = Genre.new(name)
      genre.save
      genre
  end

  def artists
    artists=self.songs.collect do |song| song.artist end
    artists.uniq
  end
  def add_song(song)
    e  = self.songs.include?(song)
    if e == false
      self.songs << song
    end
    if song.genre == nil
      song.genre = self
    end
  end
  end
