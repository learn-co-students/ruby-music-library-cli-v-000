require 'pry'


class Genre

   extend Concerns::Findable

  @all = []


  def initialize(g)
    @name = g
    @songs = []
    save
  end

  def name
    @name
  end

  def name=(g)
    @name = g

  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(g)
    Genre.new(g)
  end

def add_genre(song)
    
    if !@songs.include?(song)
      @songs << song
    end

    if song.genre == nil
      song.genre = self
    end
    
  end

  def artists
    
    a = @songs.collect do |song|
      song.artist
    end

    a.uniq
  end


end