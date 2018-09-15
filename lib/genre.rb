class Genre
  extend Concerns::Findable #extend for class methods

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

  def artists
    songs.map(&:artist).uniq ## Associations — Artist and Genre:
    #Genre #artists returns a collection of artists for all of the
    #genre's songs (genre has many artists through songs), and
    #does not return duplicate artists
  end

end
