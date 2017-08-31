class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  #Returns array of all artist objects
  def self.all
    @@all
  end

  #Clears the all array of all artist instances
  def self.destroy_all
    self.all.clear
  end

  #Saves instance of artist in the 'all' array
  def save
    self.class.all << self
  end

  #instansiates and saves a new instance of the artist class into the 'all' array
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if song.artist.nil?
      song.artist = self
    end
    unless self.songs.include?(song)
      @songs << song
    end
  end

  def genres
    genres = []
    self.songs.each do |song|
      unless genres.include?(song.genre)
        genres << song.genre
      end
    end
    genres
  end

end
