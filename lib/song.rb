class Song 
  attr_accessor :name, :artist, :genre
  @@all=[]
  
  def initialize(name, artist=nil, genre=nil)
    self.artist=artist if artist!=nil
    self.genre=genre if genre!=nil
    @name=name
  end
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    Song.all.clear
  end
  
  def save 
    Song.all << self 
  end
  
  def self.create(name)
    x=Song.new(name)
    x.save 
    x
  end
  
  def artist=(a)
      @artist=a
      a.add_song(self)
    #end
  end
  
  def genre=(g)
      @genre=g 
      g.songs << self if g.songs.include?(self)==FALSE
  
  end
  
  def self.find_by_name(name)
    @@all.find{|s| s.name==name}
  end
  
  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)!=nil 
      Song.find_by_name(name)
    else 
      Song.create(name)
    end 
  end
  
  def self.new_from_filename(fname)
    n=fname.split(' - ')
    a=Artist.find_or_create_by_name(n[0])
    g=Genre.find_or_create_by_name(n[2].chomp!('.mp3'))
    Song.new(n[1],a,g)
  end
  
  def self.create_from_filename(fname)
    s=self.new_from_filename(fname)
    s.save
    s
  end
end 




