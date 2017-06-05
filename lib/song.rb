class Song

  attr_accessor :name, :artist 

  @@all = []

  def initialize(name)
    @name = name 
  end

  def self.all 
    @@all 
  end 

  def self.destroy_all
    self.all.clear
  end 

  def self.create(new_song)
    n_song = Song.new(new_song)
    n_song.save
    n_song 
  end 

  def save 
    @@all.push(self)
  end 

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(self)
  end

end 