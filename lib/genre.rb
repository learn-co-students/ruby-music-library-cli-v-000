class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).tap {|genre| genre.save}
  end

  def add_song(song)
   song.genre = self if song.genre == nil
   @songs << song if @songs.include?(song) == false
  end

  def artists
   artist_collection = @songs.collect {|song| song.artist }.uniq
  end

end
