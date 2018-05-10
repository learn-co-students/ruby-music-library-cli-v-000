require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
    self.all
  end


  #song-artist
  def add_song(song)
    #binding.pry
    # #if song.artist == nil
    #   song.artist=(self)
    #
    #   @songs << song
    #   #binding.pry
    #   #if song.artist == self
    #   #else
    #   #  @songs << song
    # end  #end
    song.artist = self unless song.artist == self

    if @songs.include?(song)
    else
      @songs << song
    end
    #binding.pry
  end

  def songs
    @songs
  end

  #genre-artist
  def genres
    newarray=[]
    self.songs.each do |song|
      if newarray.include?(song.genre)
      else
        newarray << song.genre
      end
    end
    #binding.pry
    newarray
  end



end

#rspec spec/004_songs_and_artists_spec.rb
#rspec spec/006_artists_and_genres_spec.rb
