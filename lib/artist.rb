require 'pry'

class Artist

  attr_accessor :name, :songs, :genres, :genre

  extend Concerns::Findable
  include Concerns::Basics



  @@all = []

  def initialize(name)
    @name= name
    @songs = []
    
  end
  
  #creates a new song and stores song's artist value as self
  def add_song(song)
    if @songs.detect {|x| x == song}
      return nil
    elsif song.artist == self 
      @songs<<song
    elsif song.artist == nil
      @songs<<song
      song.artist = self
    end
    @songs
  end


  def self.all
    @@all
  end


  def genres
    all_genres = @songs.collect {|song| song.genre}

    return all_genres.uniq

  end



end