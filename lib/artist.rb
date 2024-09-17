require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.create(name)
    self.new(name)
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def add_song(song)
      unless self.songs.detect { |x| x == song }
        self.songs << song
        if song.artist == nil
          song.artist = self
        end
      end
  end

  def genres
    artist_genres = []
    @songs.each do |song|
      artist_genres << song.genre
    end
    artist_genres.uniq
  end




  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

end
