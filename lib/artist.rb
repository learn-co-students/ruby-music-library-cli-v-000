class Artist
  extend Concerns::Findable

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
  
  def save
    self.class.all << self
  end
  
  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = self.new(name)
    self.all << song
    song
  end
  
  def add_song(song)
    #puts "In Artist Class - add_song methond  #{song}"
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end
  
  def genres
    songs.map{|song| song.genre}.uniq
  end
  
end   