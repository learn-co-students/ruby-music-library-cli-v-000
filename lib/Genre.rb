class Genre

  extend Concerns::Findable
  
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs =[]
  end

  def self.all
    @@all
    end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
   genre = self.new(name)
   self.all << genre
   genre
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre != nil
  end

  def artists
    @songs.collect{|s| s.artist}.uniq
  end

end
