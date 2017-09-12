class Artist

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.class.all << self
  end


  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def add_song(song_obj)
    self.songs << song_obj unless self.songs.include?(song_obj)
    song_obj.artist ||= self
  end

  def genres
    self.songs.collect do |song_obj|
      song_obj.genre
    end.uniq
  end

  extend Concerns::Findable
end
