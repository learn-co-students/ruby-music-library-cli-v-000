class Song 
  
  attr_accessor :name, :genre
  attr_reader :artist 
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist=artist
    self.genre=genre
   
  end 
  
  def self.all 
    @@all
  end 
  
  def save
    @@all << self
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
  
 def self.create(song) 
    song = self.new(song)
    song.save 
    song 
 end 
 
 def artist=(artist)
    if artist!=nil 
      @artist = artist 
      artist.add_song(self)
    end
    
  end
  
  def genre=(genre)
    if genre!=nil 
      @genre = genre 
      if !genre.songs.include?(self)
        genre.songs << self
  end 
end 
end 
    
  def self.find_by_name(song_name)
    self.all.detect {|find| find.name == song_name }
  end     
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create(song_name)
  end 
  
  def self.new_from_filename(file_name)
    artist_song_genre = file_name.split(" - ")
    artist = Artist.find_or_create_by_name(artist_song_genre[0])
    genre = Genre.find_or_create_by_name(artist_song_genre[2].chomp(".mp3"))
    song = self.new(artist_song_genre[1], artist, genre)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end 
  
  
  
  
  
  
end 