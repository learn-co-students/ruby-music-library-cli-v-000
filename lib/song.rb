class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all=[]
  def initialize n, a=nil, g=nil
    @name=n
    @artist=nil
    @genre=nil
    if a!=nil
      self.artist=a
    end
    if g!=nil
      self.genre=g
    end
  end
  def artist= a
    @artist=a
    a.add_song(self)
  end
  def genre= a
    @genre=a
    a.add_song(self)
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all=[]
  end
  def save
    self.class.all<<self
    self
  end
  def self.new_from_filename fn
    fn=fn[0..-5]
    t=fn.split(" - ")
    a=Artist.find_or_create_by_name(t[0])
    g=Genre.find_or_create_by_name(t[2])
    Song.new(t[1],a,g)
  end
  def self.create_from_filename fn
    r=Song.new_from_filename(fn)
    if !(@@all.include?(r))
      @@all<<r
    end
    r
  end
end
