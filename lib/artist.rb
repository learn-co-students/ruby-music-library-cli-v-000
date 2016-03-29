class Artist

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
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    #does not assign the artist to the song if the song already has the artist
    # =>check if song has an artist
    #does not add the song to the artist's song collection if the artist already has the song
    # =>check if song in @songs

    song.artist = self unless song.artist != nil
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    #returns the unique genres belonging to all the songs of the artist
    songs.collect {|song| song.genre}.uniq
  end

end


