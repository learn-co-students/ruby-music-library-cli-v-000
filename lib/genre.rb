class Genre
  attr_accessor :name, :songs

  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    Genre.new(name).tap do |genre|
      genre.save
    end
  end

  def add_song(song)
    @songs << song if find_by_name(song) == nil
    song.genre = self unless song.genre == self
  end

  def find_by_name(song)
    self.songs.find{ |item| item == song}
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end

end
