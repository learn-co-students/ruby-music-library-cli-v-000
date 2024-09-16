class Genre
  attr_accessor :songs
  attr_reader :name
  extend Concerns::Findable

  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def name=(name)
    @name = name
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre == self
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    self.new(name).tap {|genre| genre.save}
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def artists
    self.songs.collect {|song| song.artist}.uniq!
  end
end