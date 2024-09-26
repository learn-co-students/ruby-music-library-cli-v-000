class Artist
  extend Concerns::Create_Destroy
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
  @@all = []  # stores artist instances

  def initialize(name)
    @name = name
    @songs = []  # array of song instances
  end

  def self.all  # self is the Artist class; returns the array of all artist instances
    @@all
  end

  def save
    @@all << self  # self is the artist instance; adds the artist instance to the @@all array
  end

  def add_song(song)  # song instance
    unless songs.include?(song)  # checks if the song instances is present in the songs array
      songs << song   # adds song instance to song array for artist instance
    end
    song.artist = self unless song.artist == self  # self is the artist instance; sets the artist property for the song instance equal to the artist instance
  end

  def genres
    songs.collect {|song| song.genre}.uniq  # iterates over the songs array, returning the genre property for each song instance; uniq method removes duplicate values
  end

end