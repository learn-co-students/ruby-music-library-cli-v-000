class Song
  attr_accessor :name, :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist == nil
      @artist = artist
    else
      self.artist=(artist)
    end
    
    if genre == nil
      @genre = genre
    else
      self.genre=(genre)
    end
  end
  
  def self.name=(name)
    @name = name
  end
  
  def artist=(artist)
    @artist = artist
    if artist != nil
      artist.add_song(self)
    end
  end
  
  def genre=(genre)
    @genre = genre
    if genre != nil
      if genre.songs.include?(self) == false
        genre.songs << self
      end
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
  
  def self.create(name)
    created_song = self.new(name)
    created_song.save
    created_song
  end
  
  def self.find_by_name(title)
    @@all.find do |song|
      song.name == title
    end
  end
  
  def self.find_or_create_by_name(title)
    song = self.find_by_name(title)
    if song == nil
      self.create(title)
    else
      song
    end
  end
  
  def self.new_from_filename(filename)
    name = filename.split(" - ")[1]
    
    a = filename.split(" - ")[0]
    artist = Artist.find_or_create_by_name(a)
    g = filename.split(" - ")[2].gsub(".mp3", "")
    genre = Genre.find_or_create_by_name(g)
    
    self.new(name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
end