class Genre

attr_accessor :name, :songs

  @@all = []


  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    instance = self.new(name)
    instance.save
    instance
  end

  def add_genre(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre
  end

  #def songs
    #Song.all.select {|song| song.genre == self}
  #end

  def artists
    songs.map {|song| song.artist}.uniq
  end
end
