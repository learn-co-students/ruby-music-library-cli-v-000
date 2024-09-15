class Genre
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
    genre = Genre.new(name)
    self.all << genre
    genre
  end

  def artists
    art = []
    @songs.each do |song|
      unless art.include?(song.artist)
        art << song.artist
      end
    end
    art
  end


  def add_song(song)
    if !(@songs.include?(song))
      @songs << song
      song.genre = self
    end
  end

end
