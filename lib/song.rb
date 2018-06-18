class Song
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist == nil
      @artist = artist
    else
      self.artist = artist
    end
    
    if genre == nil
      @genre = genre
    else
      self.genre = genre
    end
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end
  
  def save
    self.class.all << self
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
    artist
  end
  
  def genre=(genre)
    @genre = genre
    exists = false
    
    genre.songs.each do |song|
      if song == self
        exists = true
      end
    end
    
    if exists
    else
      genre.songs << self
    end
    @genre
  end
  
  def genre
    @genre
  end
  
  def name
    @name
  end
  
  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      else
        
      end
    end
    return nil
  end
  
  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) != nil
      return Song.find_by_name(name)
    else
      Song.create(name)
    end
  end
  
  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    artist = song_array[0]
    title = song_array[1]
    genre_array = song_array[2].split(".")
    artist_object = Artist.find_or_create_by_name(artist)
    genre_object = Genre.find_or_create_by_name(genre_array[0])
    new_song = Song.new(title, artist_object, genre_object)
  end
  
  def self.create_from_filename(filename)
    @@all << Song.new_from_filename(filename)
  end
  
end