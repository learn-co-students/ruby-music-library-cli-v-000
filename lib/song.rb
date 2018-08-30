class Song 
  extend Concerns::Findable
  
  @@all = []
  
  attr_accessor :name, :artist, :genre
  
  def initialize(name, artist=nil, genre=nil)
    @name = name 
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
    @@all << self
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
  
  def self.create(song)
    new_song = Song.new(song) 
    new_song.save 
    new_song
  end
  
   def artist=(artist)
    @artist = artist
    artist.add_song(self)
   end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
      self.all.detect {|song| song.name == name}
    end
  
  def self.find_or_create_by_name(name)
      if self.find_by_name(name) == nil
         self.create(name)
      else 
        self.find_by_name(name)
    end
  end
  
  def self.new_from_filename(filename)
    filename_array = filename.split(" - ")
    song_artist = Artist.find_or_create_by_name(filename_array[0])
    song_genre = Genre.find_or_create_by_name(filename_array[2][0..-5])
    song = Song.new(filename_array[1], song_artist, song_genre)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  
end
 

 
  
  
  

