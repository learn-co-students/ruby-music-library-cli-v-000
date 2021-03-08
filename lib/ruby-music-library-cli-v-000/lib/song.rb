require 'pry'
class Song
  attr_accessor :name#, :artist
  attr_reader :artist, :genre
  @@all = []


  def initialize(name, artist = nil, genre = nil) # there should be an optional second arguement ( Option meaning )
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs.push self unless genre.songs.include?(self)
  end



  def self.all
    @@all
  end

  def self.destroy_all
    all.clear #check I might need to use .clear instead
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
      #binding.pry
      self.all.find { |s| s.name == name}
    end

    def self.find_or_create_by_name(name)
      #self.all.find { |s| s.name == name} 
    end

  def self.create(name)
    song = new(name)
    song.save
    song
  end






end
