class Artist
  attr_accessor :name, :songs
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
    self.all.clear
  end

  def save
    Artist.all << self
  end 

  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)
    self.songs << song
    song.artist = self if song.artist != self
    @songs = @songs.uniq
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end

  def print
    puts self.name
  end

  def self.print_all
     self.all.each do |artist| 
       artist.print
     end
  end


end 

