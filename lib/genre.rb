class Genre
    extend Concerns::Findable
    attr_accessor :name
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
      self.all.clear
    end

    def songs
      @songs
    end

    def self.create(name)
      genre = Genre.new(name)
      genre.save
      genre
    end

  def add_song(song)
    @songs << song
    song.genre = self unless song.genre == self
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

end
