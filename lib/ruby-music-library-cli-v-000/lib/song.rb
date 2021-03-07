class Song
  attr_accessor :name, :artist
  attr_reader :artist
  @@all = []


  def initialize(song_title, artist = nil) # there should be an optional second arguement ( Option meaning )
    @name = song_title
    @artist = artist
  end


  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear #check I might need to use .clear instead
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
    # song= Song.new(song_title)
    # song.save
    # song
  end




end
