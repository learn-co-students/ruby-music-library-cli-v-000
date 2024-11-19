class Genre

  attr_accessor :name, :song, :artist
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
    song.genre = self unless song.genre == self
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

end # <--end class -->