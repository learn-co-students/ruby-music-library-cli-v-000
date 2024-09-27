require_relative "../concerns/findable.rb"
class Song
  extend Concerns::Findable
  attr_accessor :name, :genre, :artist, :filenames
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if genre != nil
      self.genre = genre
    end
    if artist != nil
      self.artist = artist 
    end
  end 

  def artist=(artist)  # artist instance
    @artist = artist
    artist.add_song(self)  # self is the song instance
  end
    
  def genre=(genre)
    @genre = genre 
    if !genre.songs.include?(self)  
      genre.songs << self
    end
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name, artist=nil, genre=nil)
    new_song = self.new(name, artist=nil, genre=nil)
    new_song.save
    new_song
  end
  
  def self.new_from_filename(file_name)
    data = file_name.split(" - ")
    artist_name = data[0]
    genre_name = data[2].split(".mp3").first
    song_name = data[1]
    Song.new(song_name,Artist.find_or_create_by_name(artist_name),Genre.find_or_create_by_name(genre_name))
    
  end
  
  def self.create_from_filename(file_name)
    new_song = Song.new_from_filename(file_name)
    new_song.save unless @@all.include?(new_song)
    new_song 
  end
  
  def self.list
    @@all.each do |song|
      puts "#{@@all.index(song)+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"    
    end
  end
  
  def self.play_song(index)
    index-=1
    play_song = @@all.fetch(index)
    puts "Playing #{play_song.artist.name} - #{play_song.name} - #{play_song.genre.name}"
  end
   
  
 
end