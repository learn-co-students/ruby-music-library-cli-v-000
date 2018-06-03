require "pry"
class Song
  extend Concerns::Findable
  attr_accessor :name, :genre, :artist
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    self.name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include? self
  end
    
  def self.all 
   @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.find_by_name(song_name)
    self.all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create(song_name)
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
  
  def self.create(new_from_filename)
     song = self.new(new_from_filename)
     song.save
     song
  end
  
   def self.create_from_filename(filename) 
     neb = new_from_filename(filename)
     neb.save
   end
   
   def self.new_from_filename(empty_variable)
     fishwings=empty_variable.split(" - ")
     artist = Artist.find_or_create_by_name(fishwings[0])
     genre = Genre.find_or_create_by_name(fishwings[2].split(".")[0])
     new(fishwings[1], artist, genre)
   end
     
    def list_artist
    puts "Enter artist"
    specific_artist = gets.chomp
    if Artist.find_by_name(artist) != nil
      Artist.find_by_name(artist).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
    else
      puts "Artist does not exist"
    end
  end
end  
  
  
