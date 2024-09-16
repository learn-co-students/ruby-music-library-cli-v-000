class Genre
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.count
    @@all.size
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
      if song.genre == nil
        song.genre = self
      end
    end
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

end
