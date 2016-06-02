class Genre
  
  extend Concerns::Findable
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre == self
  end
  
  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end
  
  def artists
    all_artists = self.songs.collect {|song| song.artist}
    all_artists.uniq
  end

  def self.destroy_all
    self.all.clear
  end

end