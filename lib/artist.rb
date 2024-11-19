class Artist

  attr_accessor :name
    extend Concerns::Findable

  @@all = []

#////////// CLASS METHODS //////////

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
    new_obj = self.new(name)
    new_obj.save
    new_obj
  end

#////////// INSTANCE METHODS //////////

  def songs
    @songs
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

end # <--end class -->