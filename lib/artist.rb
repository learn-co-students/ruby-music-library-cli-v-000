class Artist
  attr_accessor :name, :songs, :genres
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    @@all << artist
    artist
  end

  def add_song(song)
    unless @songs.include?(song)
      @songs << song
    end
    if song.artist == nil
      song.artist = self
    end
  end

  def songs
    @songs
  end

  def genres  #needs work
      self.songs.collect do |song|
        unless @songs.include?(song.genre)
          song.genre
        end
    end
  end

  def self.find(name) #finds exisitng artist by name
    self.all.find {|artist| artist.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find(name) || self.create(name)
  end

end
