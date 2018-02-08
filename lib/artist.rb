class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all= []
  def initialize(name)
    @name=name
    @songs= []
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @all= []
  end
  def save
    @@all << self
    self
  end
  def self.create(name)
    artist= new(name)
    artist.save
  end
  def add_song(song)
    #if !song.artist
      @songs << song unless @songs.include?(song)
      song.artist= self if !song.artist
    #end
  end
    def genres
      @songs.collect{|song| song.genre}.uniq
    end
    def self.destroy_all
      @@all= []
    end
  end
