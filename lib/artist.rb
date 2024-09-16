class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def self.all
    @@all.sort_by!{|a| a.name}
  end

  def self.destroy_all
    @@all.clear
  end

  #problems somewhere here
  def self.create(name)
     Artist.new(name).tap{|new_artist| new_artist.save}
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs.sort_by!{|a| a.name}
  end
  
  def add_song(song)
    self.save unless self.class.all.include?(self)
    self.songs << song unless self.songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def save
    @@all << self
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end

end
