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
  
  def list_songs
    @songs.each {|song| song.print}
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self 
  end

  def self.create(name)
    Genre.new(name).save
  end

  def add_song(song)
    if !@songs.include? song
      @songs << song
      song.genre = self
    end
  end

  def artists
    #collect the unique artists from all songs in the genre
    (@songs.collect {|song| song.artist}).uniq
  end
end
