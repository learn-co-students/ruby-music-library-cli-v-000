class Song
  
  attr_accessor :name, :artist, :genre
  
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    #puts "In Song Class - initialize"
    #puts "Song name is #{name}"
    #puts "Artist name is #{artist}"
    #puts "Genre name is #{genre}"
    #puts "---------------------------"
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    song = self.new(name)
    self.all << song
    song
  end
  
  def artist=(artist)
    #puts "In artist method #{name} #{artist}"
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
     found_song = @@all.detect {|song| song.name == name}
     found_song
  end
  
  def self.find_or_create_by_name(name)
 
     found_song = self.find_by_name(name)
 
    if found_song
      found_song
    else
      self.create(name)
    end
    
  end
 
  def self.new_from_filename(filename)
    #puts "Filename is #{filename}"
    
    song_array = filename.split(" - ")
    
    name = song_array[1] = song_array[1]
    artist_name = song_array[0]
    genre = song_array[2].chomp(".mp3")
    
    #puts "Name is #{name}"
    #puts "artist_name is #{artist_name}"
    #puts "genre is #{genre}"
    
    found_artist = Artist.find_or_create_by_name(artist_name)
    found_genre = Genre.find_or_create_by_name(genre)
    
    #puts "found_artist is #{found_artist}"
    #puts "found_genre is #{found_genre}"
    new(name, found_artist, found_genre)
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save if !@@all.include?(song)
    song
  end
  
end #end Song Class  