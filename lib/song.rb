class Song 
  
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def self.create(name, artist=nil, genre=nil)
    new_song = self.new(name, artist=nil, genre=nil)
    new_song.save
    new_song
  end
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self) 
  end
  
  def genre=(genre)
    @genre = genre 
    genre.add_song(self) 
  end
  
  def self.find_by_name(name) 
    @@all.find {|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name) 
    if self.find_by_name(name) != nil
      song = self.find_by_name(name) 
    else
      song = self.create(name) 
    end
  end 
  
  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    genre_name = filename.split(" - ")[2].chomp('.mp3')
    song = Song.find_or_create_by_name(song_name) 
    artist = Artist.find_or_create_by_name(artist_name) 
    genre = Genre.find_or_create_by_name(genre_name) 
    song.artist = artist
    song.genre = genre 
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save 
    song
  end
 
  def self.all 
    @@all.uniq 
  end 
  
  def self.destroy_all 
    @@all = []
  end 
  
  def save 
    @@all << self unless @@all.include?(self)
  end
end

