class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all=[]
  def initialize n
    @name=n
    @songs=[]
  end
  def self.all
    @@all
  end
  def add_song s
    if songs.include?(s)
      return nil
    elsif s.artist==nil
      s.artist=self
    else
      self.songs<<s
    end
  end
  def self.destroy_all
    @@all=[]
  end
  def save
    self.class.all<<self
    self
  end
  def genres
    self.songs.map { |e| e.genre }.uniq
  end
end
