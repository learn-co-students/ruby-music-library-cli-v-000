class Artist

  extend Concerns::Findable

  @@all = []
  
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    @songs.collect do |song|
      song.genre
    end.uniq
  end

  def add_song(song_object)
    if !@songs.include?(song_object)
       @songs << song_object
       if !song_object.artist
         song_object.artist = self
       end
    end

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

end
