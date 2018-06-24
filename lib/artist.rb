class Artist
  extend Concerns::Findable #calls upon the module by extending it
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    song = new(name)
    song.save
    song #was giving a nested array and was expecting a song return
  end

  def songs
    @songs
  end

  def genres
    songs.map(&:genre).uniq
    #works like do or {} except easier and without setting genres attribute
    #genre_collection = []
    #songs.collect {|song| song.genre}.uniq #remember uniq is to we out duplicates
  end

  def add_song(song)
    song.artist = self unless song.artist
    #assign Artist instance to song class artist attribute unless song has an artist class.
    @songs << song unless @songs.include?(song) #song object is being pushed to array not artist attr.
  end

end
