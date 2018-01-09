class Genre

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def add_song(song)
    if song.genre == nil
      song.genre = self
    end
    if !(self.songs.detect {|s| s == song})
      self.songs << song
    end
  end

  def songs
    @songs
  end

end
