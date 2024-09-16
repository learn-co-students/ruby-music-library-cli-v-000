class Artist
  attr_accessor :name, :songs, :genre
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
    created_song = self.new(name)
    created_song.save
    created_song
  end
  
  def add_song(song_instance)
    if song_instance.artist != self
      song_instance.artist = self
    end
    if !@songs.include?(song_instance)
      @songs << song_instance
    end
  end
   
  def genres
    songs.map(&:genre).uniq
  end

end

