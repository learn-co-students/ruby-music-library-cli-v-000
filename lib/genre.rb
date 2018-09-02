class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all=[]
  def initialize(name)
    @songs=[]
    @name=name
  end 
  def artists 
    a=[]
    @songs.each{|s| a << s.artist if a.include?(s.artist)==FALSE}
    a
  end
  def self.all 
    @@all 
  end 
  def self.destroy_all
    Genre.all.clear
  end 
  def save 
    Genre.all << self 
  end 
  def self.create(name)
    x=Genre.new(name)
    x.save 
    x
  end
end
