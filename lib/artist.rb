class Artist

  extend Concerns::Findable

  attr_accessor :name, :song, :genre

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
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def songs
    @songs
  end

  def find_song(song)
    self.songs.find{|s| song == song}
  end

  def add_song(song)
          #assigns the current artist to the song's 'artist' property
          #does not assign the artist if the song already has an artist
    song.artist == nil ? song.artist=(self) : nil
          #if it already exists in @songs
    if song == self.find_song(song)
          #does not add the song to the current artist's collection of songs
      nil
    else
          #adds the song to the current artist's 'songs' collection
      @songs << song
    end
  end

  def genres
    #iterate over song collection and collect genres without repeating
    collection = []
    @songs.collect{|s| collection << s.genre}
    collection.uniq
  end


  #binding.pry

end
