class Artist

  extend Concerns::Findable
  attr_accessor :name , :songs

  @@all = []

  def initialize(name, artist = nil)
    @name = name
    @songs = []
    @artist = artist
  end

  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self

  end

  def self.create(name)
    artist = Artist.new(name)
    self.all << artist
    artist

  end

  def add_song_by_name(name)
      song = Song.new(name)
      @songs << song
      song.artist = self
  end


  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    #iterate throihg songs array
    #for each song figure out its genre
      #for each genre figure which are unique (so that you dont duplicate)
    self.songs.collect{|song| song.genre}.uniq
  end

end
