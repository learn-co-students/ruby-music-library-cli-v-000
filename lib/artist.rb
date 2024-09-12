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

  #resets the @@all class variable to an empty array
  def self.destroy_all
    @@all.clear
  end

  #adds the artist instance to the @@all class variable
  def save
    @@all << self
  end

  #initializes and saves the artist
  def self.create(name)
    self.new(name).tap{|new_artist| new_artist.save}
  end

  #adds the artist to the song, and then adds the song to @songs if it isnt already in there
  def add_song(song)
    song.artist = self unless song.artist == self #does not assign the artist to the song if the song already has the artist
    @songs << song unless @songs.include?(song)
  end

  #artists has many genres through song
  def genres
     @songs.collect do |song|
       song.genre
     end.uniq
  end
end
