class Song 

  attr_accessor :name, :genre, :artist
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name, artist = nil, genre = nil)
   @name = name
   self.artist = artist if artist
   self.genre = genre if genre
  end
  
  def self.create(name)
    song = new(name)
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
 
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include? self

  end
  
  def self.destroy_all
    all.clear
  end
  
  def save
    self.class.all << self
  end
  
  def self.find_by_name(name)
    self.all.detect {|x| x.name == name} 
  end
  
  def self.find_or_create_by_name(name)
    if find_by_name(name).nil?
        self.create(name)
      else
        find_by_name(name)
      end
  end

  def self.new_from_filename(name)
    file = name.chomp(".mp3").split(" - ")
    song = Song.new(file[1])
    song.artist = Artist.find_or_create_by_name(file[0])
    song.genre = Genre.find_or_create_by_name(file[2])
    song.save
    song
  end

  def self.create_from_filename(name)
    new_from_filename(name).tap{ |s| s.save }
  end
end
  