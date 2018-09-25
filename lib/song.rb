require 'pry'

class Song 
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    
    unless artist.nil?
      self.artist = artist
      self.genre = genre unless genre.nil? 
      
      # genre is the SECOND optional argument, so it's ALWAYS nil when artist is nil.
      # This logic works unless you call Song.new("Song Name", nil, "Genre Name").
    end
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
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self) # This might never be true.
  end
  
  def genre=(genre)
    @genre = genre 
    @genre.songs << self unless @genre.songs.include?(self)
  end
  
  def self.find_by_name(name_of_song)
    self.all.detect{|song| song.name == name_of_song}
  end
  
  def self.find_or_create_by_name(name_of_song)
    # I tried using #tap, but it returns whatever calls it, including nil.
    song = self.find_by_name(name_of_song)
    
    song.nil? ? self.create(name_of_song) : song
  end
end 