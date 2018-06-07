class Artist
  attr_accessor :name
  attr_reader :songs

  extend Concerns::Findable

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
    @@all << self
  end

  def self.create(name)
    self.new(name).tap do |artist|
    artist.save
    end
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def genres
     songs.collect {|song| song.genre}.uniq
  end

end
