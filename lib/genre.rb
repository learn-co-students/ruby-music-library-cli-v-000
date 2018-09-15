class Genre

attr_accessor :name

@@all = []

  def initialize(name)
    @name= name
    @songs = []
  end

  def songs
    @songs
  end


  def add_song(song)
    if !songs.include?(song) # or if songs.include?(song) == false
      songs << song
    end

    song.genre = self unless (song.genre == nil) == false

  end


  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(kind)
    genre = Genre.new(kind)
    genre.save
    genre
  end

end
