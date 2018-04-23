class Genre  
  attr_accessor :name, :song, :artist  
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def songs
    @songs
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
  
  def self.create(name)
    genre = self.new name
    @@all << genre.save
  end 
  
  def artists
    @songs.map do |song|
      song.artist
    end.uniq
  end
  
  def add_song(song)
    if !self.songs.include?(song)
        self.songs.push(song)
        end
    end
end