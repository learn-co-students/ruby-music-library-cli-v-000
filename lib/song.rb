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
  
  def self.create(name) # Next time, wrap the functionality of #new with optional args.
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
  
  def self.find_or_create_by_name(name_of_song) # This can be refactored with ||
    # I tried using #tap, but it returns whatever calls it, including nil.
    song = self.find_by_name(name_of_song)
    
    song.nil? ? self.create(name_of_song) : song
  end
  
  def self.new_from_filename(filename)
    split_file = filename.split(" - ")
    
    artist = Artist.find_or_create_by_name(split_file[0])
    genre = Genre.find_or_create_by_name(split_file[2].gsub(".mp3", ""))
    
    self.new(split_file[1], artist, genre)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).tap{|song| song.save}
  end
end 