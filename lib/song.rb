
class Song
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :artist, :genre
  attr_writer 
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @genre = genre
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end 
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end 
  
  def save
    self.class.all << self
  end
  
  def self.create(name)
    @@all << song = self.new(name)
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre
    @genre
  end 
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  # def self.find_by_name(song_name)
  #   @@all.detect{|instance| instance.name == song_name}
  # end
  
  # def self.find_or_create_by_name(song_name)
  #   self.find_by_name(song_name) || self.create(song_name)
  # end

end