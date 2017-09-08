class Artist

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []


  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song)
    song.artist = self unless song.artist # make the song's artist = to artist if it doesnt exits
    @songs << song unless @songs.include?(song) # to the instances artist if it isnt in there already
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    name = self.new(name)
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def genres
    songs.collect do |songs|
        songs.genre
    end.uniq
  end

end
