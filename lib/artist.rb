class Artist 
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

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self 
  end

  def list_songs
    @songs.each {|song| song.print}
  end

  def self.create(name)
    Artist.new(name).save
  end

  def add_song(song)
    #add song to songs if the artist doesn't have it already
    if !@songs.include? song
      @songs << song
      song.artist = self
    end
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end
end
