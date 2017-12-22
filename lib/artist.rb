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


    # assigns the current artist to the song's 'artist' property
    # does not assign the artist if the song already has an artist
    # if it already exists in @songs
     #does not add the song to the current artist's collection of songs
    # adds the song to the current artist's 'songs' collection
  def add_song(song)
    # Does not assign the artist if the song already has an artist
    if song.artist == self
      # does not add the song to the current artist's collection of songs if it already exists therein
      self.find_song(song) ? nil : @songs << song
    else
      song.artist = self
      # does not add the song to the current artist's collection of songs if it already exists therein
      self.find_song(song) ? nil : @songs << song
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
