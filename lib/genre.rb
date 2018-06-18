class Genre
  extend Concerns::Findable
    attr_accessor :name
    attr_reader :songs
  @@all=[]
  
  
  def initialize(name)
    @name=name
    self.save
    @songs=[]
  end
  
  def name
    @name
  end
  
  def name=(name)
    @name=name
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
    self.new(name)
  end
  
  def add_song(song)
    Song.new(song)
    unless @songs.include?(song)
      @songs << song
    end
    if song.genre == nil
      song.genre=self
    end
  end
  def artists
    songs.map{|song| song.artist}.uniq
  end




end