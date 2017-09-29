require 'pry'

class Genre

  attr_accessor :name, :artist, :songs, :song

  extend Concerns::Findable
  include Concerns::Basics


  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    
  end

   def add_song(song)
    if @songs.include?(song)
      nil
    else
      @songs<<song
    end
    end

  def self.all
    @@all
  end




  def artists
    all_artists = @songs.collect {|song| song.artist}
    return all_artists.uniq
  end

end