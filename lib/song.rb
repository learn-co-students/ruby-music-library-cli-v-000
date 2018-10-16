class Song
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name= name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
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
  
  def self.create(song_name)
    song_name = Song.new(song_name)
    song_name.save
    song_name
  end
  
  def artist=(artist)
    @artist= artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre= genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    @@all.find do |song| 
      if song.name == name
        return song
      end  
    end
  end
  
  def self.find_or_create_by_name(song)
    if @@all.include?(song)
      self.find_by_name(song)
    elsif !@@all.include?(song)
      self.create(song)
    end
  end
  
end