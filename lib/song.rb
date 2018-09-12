class Song
  
  
  
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name, artist= nil, genre= nil)
  @name = name
  self.genre= genre if genre!=nil
  self.artist= artist if artist!=nil
  end

  def self.all 
    @@all
  end

  def self.destroy_all
     self.all.clear
  end
  
  def save
    @@all << self
  end

  def self.create(song)
    s = Song.new(song)
    s.save
    s
  end
  
 def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre
    @genre
  end
  
   def genre= (genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    split_file = filename.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(split_file[0])
    genre = Genre.find_or_create_by_name(split_file[2])
    self.new(split_file[1], artist, genre)
  end
  
   def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

end


