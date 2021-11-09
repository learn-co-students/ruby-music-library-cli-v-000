class Artist
  extend Concerns::Findable
  attr_accessor :name, :song, :genre
  @@all = [] #sets class variable

  def initialize(name)
    @name = name #set instance variable
    @songs = []
  end

  def save
    @@all << self #adds artist to list of artists
  end

  def songs
    @songs #revelas the Artist song collection :)
  end

  def genres
    songs.collect{|g| g.genre}.uniq
  end

  def self.all
    @@all #reveals the list of artist
  end

  def self.destroy_all
    @@all.clear #clears list of artist
  end

  def self.create(name)
    Artist.new(name).tap {|a| a.save} #initializes and saves the artist to @@all
  end

  def add_song(song)
    song.artist = self unless song.artist  #assigns song to artist in the song has not already been assigned an artist
    @songs << song unless @songs.include?(song) #adds the song to artists catalog unless it already includes song
  end
end
