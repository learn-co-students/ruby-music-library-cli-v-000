class Genre extend Concerns::Findable
  attr_reader :songs
  attr_accessor :name
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
    genre = self.new(name)
    genre.save
    genre
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
    
  def self.find_by_name(name)
    @@all.find {|genre| genre.name == name}
  end
end