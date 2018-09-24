require 'pry'

class Artist 
  attr_accessor :name 
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end 
  
  def self.all 
    @@all
  end 
  
  def save 
    self.class.all << self
  end 
  
  def self.destroy_all 
    self.all.clear
  end 
  
  def self.create(name)
    self.new(name).tap {|song| song.save}
  end 
  
  def add_song(song)
    # Sets the song's artist equal to self unless the song has an artist.
    # I could also add the song to @songs unless the song has an artist.
    # But then I wouldn't be checking if @songs already HAS the song!
    
    # Also, the last line of code makes sure that the song isn't added to @songs if @songs already has the song, or the song has a different artist or no artist at all.
    song.artist = self unless song.artist
    self.songs << song if !self.songs.include?(song) && song.artist == self
  end
  
  def genres 
    self.songs.collect{|song| song.genre}.uniq
  end
end 
