class Song
  attr_accessor :name, :artist, :genre

  @@all=[]

  def initialize(name,artist=nil,genre=nil)
    @name=name
    @artist=artist
  end
    def artist
      @artist
    end
    def artist=(artist)
      @artist=artist
      @artist.add_song(self)
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
    created_song=self.new(name)
    created_song.save
    created_song
  end




end
