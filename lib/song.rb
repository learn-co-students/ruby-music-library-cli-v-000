class Song 
  extend Concerns::Findable
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
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
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
    
  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end
  
  def self.new_from_filename(file)
    a = file.split(" - ")[0]
    s = file.split(" - ")[1]
    g = file.split(" - ")[2].chomp(".mp3")
    ai = Artist.find_or_create_by_name(a)
    gi = Genre.find_or_create_by_name(g)
    Song.new(s, ai, gi)
  end 
  
  def self.create_from_filename(file)
    new_from_filename(file).save
  end 
end