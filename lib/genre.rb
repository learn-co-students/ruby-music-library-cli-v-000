class Genre

  attr_accessor :name, :songs

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def save
    @@all.push(self)
  end

  def add_song(song)
    unless @songs.include?(song)
      @songs << song
    end
    if song.genre == nil
        song.genre = self
    end
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

end
