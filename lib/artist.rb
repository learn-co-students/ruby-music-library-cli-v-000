class Artist
  extend Concerns::Findable
  @@all=[]
  attr_accessor :name
  attr_reader :songs, :song
  def initialize(name)
    @songs=[]
    @name=name
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
  def self.create(name)
  new(name).tap{|a| a.save}
  end
  def add_song(song)
     song.artist = self unless song.artist
     songs << song unless songs.include?(song)
   end
   def genres
songs.collect{|x|x.genre}.uniq
   end

end
