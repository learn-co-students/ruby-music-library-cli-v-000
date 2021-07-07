class Genre

  @@all = []

  attr_accessor :name
  attr_reader :songs

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
    song_obj.genre ||= self
  end

  def artists
    self.songs.collect do |song_obj|
      song_obj.artist
    end.uniq
  end

  extend Concerns::Findable

end
